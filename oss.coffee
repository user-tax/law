#!/usr/bin/env coffee

> ./ossLi.mjs
  @iuser/ossput
  @rmw/thisdir
  @rmw/pool:Pool
  @iuser/walk > walkRel
  fs/promises > opendir readFile
  path > join

DIR = thisdir import.meta
DOC = join DIR, 'doc'


put = await ossput(ossLi, 'user-law')

pool = Pool 10

for await name from walkRel DOC
  if name.endsWith '.md'
    console.log name
    await pool put, name[..-4], (await readFile join(DOC,name)), 'text/plain'

await pool.done
