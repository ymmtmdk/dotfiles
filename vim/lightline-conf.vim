let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_removed = '-'

let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'readonly'], [ 'filename', 'gitstatus' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileinfo', 'filetype' ] ]
      \
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'filename': 'LightLineFilename',
      \   'gitstatus': 'MyGitStatus',
      \   'fileinfo': 'FileInfoRight',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': ''},
      \ }

function! FtCond()
  return &ft !~? 'help\|vimfiler\|undotree'
endfunction

function! FileInfoRight()
  return FtCond() ? &fenc . ':' . &fileformat : ''
endfunction

function! LightLineFilename()
  return ('' != expand('%:t') ? expand('%:t') : '[No Name]') . MyModified()
endfunction

function! MyReadonly()
  return FtCond() && &ro ? '--read only--' : ''
endfunction

function! MyModified()
  return FtCond() && &modified ? '!' : ''
endfunction

function! MyGitStatus()
  return MyFugitive() . MyGitGutter()
endfunction

function! MyFugitive()
  return FtCond() && exists('*fugitive#head') && strlen(fugitive#head())
        \ ? ' '.fugitive#head() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  let res = join(ret, ' ')

  return res != '' ? ' ' . res : ''
endfunction

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['mediumcyan', 'darkestcyan'], ['white', 'gray7'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray10', 'gray6'], ['gray9', 'gray4'] ]
let s:p.inactive.right = [ ['gray4', 'gray5'], ['gray4', 'gray4'], ['gray4', 'gray4'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'mediumcyan', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'darkestred'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray4' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'white', 'gray7' ] ]
let s:p.tabline.middle = [ [ 'white', 'black' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray4' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray4', 'yellow' ] ]

let g:lightline#colorscheme#default#palette = lightline#colorscheme#fill(s:p)

