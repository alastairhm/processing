size(600, 600)
background('#004477')
noFill()
stroke('#FFFFFF')
strokeWeight(3)

size=25

col = 0
row = 0
for i in range(1, (width*height)/size):
    if int(random(2)):
        arc(col, row, size, size, 0, PI/2)
        arc(col+size, row+size, size, size, PI, PI*1.5)
    else:
        arc(col+size, row, size, size, PI/2, PI)
        arc(col, row+size, size, size, PI*1.5, 2*PI)        
    col += size
    if i % (width/size) ==0:
        row +=size
        col = 0
        
saveFrame("output.png")
        
