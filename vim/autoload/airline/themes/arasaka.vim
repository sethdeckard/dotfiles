" Arasaka HUD theme for vim-airline
" Palette: bg=#0a0f14 bg_alt=#131923 muted=#55606b fg=#93a1ad
"          yellow=#f7f779 cyan=#35f2ff red=#ff4d6d orange=#ff9f1c

let g:airline#themes#arasaka#palette = {}

" Normal mode
let s:N1 = ['#0a0f14', '#f7f779', 233, 227]
let s:N2 = ['#93a1ad', '#131923', 252, 234]
let s:N3 = ['#93a1ad', '#0a0f14', 252, 233]
let g:airline#themes#arasaka#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Insert mode
let s:I1 = ['#0a0f14', '#35f2ff', 233, 51]
let s:I2 = ['#93a1ad', '#131923', 252, 234]
let s:I3 = ['#93a1ad', '#0a0f14', 252, 233]
let g:airline#themes#arasaka#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Visual mode
let s:V1 = ['#0a0f14', '#ff4d6d', 233, 204]
let s:V2 = ['#93a1ad', '#131923', 252, 234]
let s:V3 = ['#93a1ad', '#0a0f14', 252, 233]
let g:airline#themes#arasaka#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Replace mode
let s:R1 = ['#0a0f14', '#ff4d6d', 233, 204]
let s:R2 = ['#93a1ad', '#131923', 252, 234]
let s:R3 = ['#93a1ad', '#0a0f14', 252, 233]
let g:airline#themes#arasaka#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive
let s:IA1 = ['#55606b', '#131923', 240, 234, '']
let s:IA2 = ['#55606b', '#131923', 240, 234, '']
let s:IA3 = ['#55606b', '#0a0f14', 240, 233, '']
let g:airline#themes#arasaka#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Command mode (same as normal)
let g:airline#themes#arasaka#palette.commandline = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Warning/error sections
let g:airline#themes#arasaka#palette.normal.airline_warning = ['#0a0f14', '#ff9f1c', 233, 214, 'bold']
let g:airline#themes#arasaka#palette.normal.airline_error = ['#0a0f14', '#ff4d6d', 233, 204, 'bold']
let g:airline#themes#arasaka#palette.insert.airline_warning = ['#0a0f14', '#ff9f1c', 233, 214, 'bold']
let g:airline#themes#arasaka#palette.insert.airline_error = ['#0a0f14', '#ff4d6d', 233, 204, 'bold']
let g:airline#themes#arasaka#palette.visual.airline_warning = ['#0a0f14', '#ff9f1c', 233, 214, 'bold']
let g:airline#themes#arasaka#palette.visual.airline_error = ['#0a0f14', '#ff4d6d', 233, 204, 'bold']
