[ncurses Download Page](http://ftp.gnu.org/gnu/ncurses/)


PATCH:
Q:
In file included from ../ncurses/curses.priv.h:283:0,
                 from ../ncurses/lib_gen.c:19:
_1571.c:835:15: error: expected ‘)’ before ‘int’
../include/curses.h:1594:56: note: in definition of macro ‘mouse_trafo’
 #define mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)
 
A:
Edit lib_gen.c
vim ./ncurses/lib_gen.c +923
mouse_trafo (int * a1, int * a2,  -->  (mouse_trafo) (int * a1, int * a2,
