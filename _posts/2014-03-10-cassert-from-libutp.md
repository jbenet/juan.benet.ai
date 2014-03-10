---
layout: post
title:  CASSERT from libutp
date:   2014-03-10 05:19:11 -08:00
categories: note
---
 [CASSERT](https://github.com/bittorrent/libutp/blob/master/utp_types.h#L101-L107) from [libutp](https://github.com/bittorrent/libutp). Clever.

```cpp
/* compile-time assert */
#ifndef CASSERT
#define CASSERT( exp, name ) typedef int is_not_##name [ (exp ) ? 1 : -1 ];
#endif

CASSERT(8 == sizeof(uint64), sizeof_uint64_is_8)
CASSERT(8 == sizeof(int64), sizeof_int64_is_8)
```
