# copy, cut, paste in normal mode
*terminology*: copy is yank (y), cut is delete (d), paste is put (p). 


### copy (y)
* yy: copies the current line, including the newline character
* 3yy: copies three lines, starting from the cursor.
* y$: copies everything from the cursor to the end of the line.
* yw: copies to the start of the new word
* yiw: copies the current word
* y%: copies to the matching characters. It supports pairs are (), {}, []. And useful to copy text between matching brackets.


### delete (d)
* dd: deletes the current line, including the new line character
* 3dd: deletes three lines, starting from the cursor. 
* d$: deletes everything from the cursor to the end of the line. 
* dw: deletes to the start of the next word
* d^: deletes everything from the cursor to the start of the line


### paste (p)
* p: pastes the text after the cursor. 
* P: pastes before the cursor.


# copy, cut, paste in visual mode
visual mode allows selecting and manipulate text. 
1. Place the cursor to the line you want to begin copping or cutting. 
2. there are three sub types:
  * v: enter the visual mode
  * V: enter visual line mode, where the text is selected by line
  * Ctrl + V: enter visual block mode. In this mode, text is selected by rectangle blocks.
3. Move the cursor to the end of the text you want to copy or cut. You can use the navigator key.
4. Press `y` to copy, `d` do cut
5. Move the cursor to where you want to paste
6. `P`: paste the content before the cursor, `p` to paste after the cursor.  
