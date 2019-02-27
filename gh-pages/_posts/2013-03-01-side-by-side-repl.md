---
layout: post
title:  Mutable REPL
date:   2014-03-01 18:28:00 -08:00
categories: note
---

Would be great to have a REPL with mutable definitions in another pane. The definitions pane lists all state, in the form:

```
<expr num>  <name> = <original evaled expression>
```

And it reassigns variables as the expressions are edited, on every keystroke (if it evaluates. if not, display eval error in a gutter below).

I hope LightTable already does this. And, I wish a REPL-UI lib existed to simplify this and other common aspects of writing REPLs. And `repl <lang>` should also exist.
