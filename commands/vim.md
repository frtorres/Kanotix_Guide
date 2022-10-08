<img align="right" src="../kanotix48.png">
## Kanotix_Guide
###### Commands: vim editor picks
###### Wed 16 Mar 2022 09:11:24 PM EST
---


0. References:
http://www.openvim.com/
http://vimgenius.com/
https://riptutorial.com/vim/awesome-learning/tutorial
https://developer.ibm.com/technologies/systems/tutorials/au-customize_vi/
https://www.cs.swarthmore.edu/oldhelp/vim/stream.html
https://docstore.mik.ua/orelly/linux/lnut/ch11_14.htm
https://riptutorial.com/vim/awesome-learning/book


MACROS: https://www.redhat.com/sysadmin/use-vim-macros

Recording a macro in (normal mode): "q" then <key (register) to record the macro> then <commands sequence for macro> then q 



```
q<register><commands>q
```

macro that inserts a new line and save it to register "a", use this sequence:

```
qao<ESC>q
During recording: ^M for ENTER, ^[ for SCAPE

```

To verify recorded macro at "a" Key:
```
:reg
 c  "a   />^Mct,^[<80><fd>a
```

To execute recorded macro recorded at "a" key:

```
%:normal @a
```




One Liners:
-----------
Convert multiple spaces to ONE space.
```
:%s/ \{2,}/ /g 
```

Using a different separator to avoid excesive "\"
```
:%s:</channel>:,"mitvChannelId"XXX:g    
```

Replace " at the end of each line for "},
```
:%s /"$/"},/g
```

Search for a string "/ " then ENTER then "c" then "t" then "," means: 
    delete every character from found string caracter to next ","
This is the recorded macro

```
/>^Mct,^[<80><fd>a
```




#bash-support.vim : Bash IDE
https://www.vim.org/scripts/script.php?script_id=365

1. Configuration
https://github.com/amix/vimrc

    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    cd .vim_runtime/
    ./install_awesome_vimrc.sh


Accessing the system clipboard
------------------------------

https://vim.fandom.com/wiki/Accessing_the_system_clipboard
http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim


Cut and Paste to internal clipboard:
-------------------------------------
Position the cursor where you want to begin cutting.
Press v to select characters, or uppercase V to select whole lines, or Ctrl-v to select rectangular blocks (use Ctrl-q if Ctrl-v is mapped to paste).
Move the cursor to the end of what you want to cut.
Press d to cut (or y to copy).
http://vim.wikia.com/wiki/Copy,_cut_and_paste

-------------------------------------

"+y

or

Put set clipboard=unnamed in your vimrc .

or ESC :set clipboard=unnamed

Back to Normal mode (Press escape[esc]), press y to copy.
If you want to paste something from OS's clipboard, press p/P in Vim Normal mode.

:put +

to paste with indentation


1. Removes BOM of UTF8 files <U+FEFF> Unicode Character 'ZERO WIDTH NO-BREAK SPACE' (U+FEFF)
-----
# vim file_name
# Remove all BOM characters:
:set nobomb
# Save the file:
:wq
-----
OR
-----
vim -b fileName

Now those "hidden" characters are visible (<feff>) and can be removed.
-----

1.-  error- opening a root owned file with another sudo account

    For some reason the file you are writing to cannot be created or overwritten.
    The reason could be that you do not have permission to write in the directory
    or the file name is not valid.

    :w !sudo tee % > /dev/null

    will save the file.

1.- HELP

Vim has a builtin help system, I just quoted what it says to :h E212.
