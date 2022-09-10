#!/usr/bin/env coffee

> @iuser/walk
  @iuser/read
  @iuser/write
  @rmw/thisdir
  path > join

DOC = join thisdir(import.meta), 'doc'

for await fp from walk DOC
  li = []
  for i from read(fp).split '\n'
    if i.startsWith '#'
      t = []
      for i from i.split ' '
        t.push i[0].toLocaleUpperCase() + i[1..]
      i = t.join(' ')
    li.push i
  await write fp, li.join('\n')


