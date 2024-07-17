size(1200, 600)
background('#D65702')
fill('#F7C600')
stroke('#A0A0A0')
strokeWeight(1)

size=25

col = 0
row = 0
for i in range(1, (width*height)/size):
    if int(random(2)):
        triangle(col, row, col+size, row, col+size, row+size)
    else:
        triangle(col, row, col, row+size, col+size, row+size)
    col += size
    if i % (width/size) ==0:
        row +=size
        col = 0
        
saveFrame("output.png")
        
