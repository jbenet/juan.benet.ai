require "open4"

module Jekyll
  class TikzBlock < Liquid::Block

    def parse(tokens)
      @nodelist ||= []
      @nodelist.clear

      while token = tokens.shift
        if token =~ FullToken
          if block_delimiter == $1
            end_tag
            return
          end
        end
        @nodelist << token if not token.empty?
      end
    end

    def render(context)
      content = @nodelist.join(' ')
      content = self.unindented(content)
      content = self.tikz_render(content)
      return '<div class="tikz">' + content + "</div>"
    end

    def unindented(content)
      lines = content.rstrip.split(/\r\n|\r|\n/).select { |line| line.size > 0 }
      indentation = lines.map do |line|
        match = line.match(/^(\s+)[^\s]+/)
        match ? match[1].size : 0
      end
      indentation = indentation.min
      return indentation ? content.gsub(/^#{' |\t' * indentation}/, '') : content
    end

    def tikz_render(content)
      content << "\n"
      pid, stdin, stdout, stderr = Open4::popen4 "tikz2svg"
      stdin.puts content
      stdin.close

      out = ""
      stdout.each do |line|
        out << line
      end

      ignored, status = Process::waitpid2 pid
      if status != 0
        puts out
        raise SyntaxError.new "Error rendering tikz"
      end

      return out
    end
  end

  Liquid::Template.register_tag("tikz", TikzBlock)
end
