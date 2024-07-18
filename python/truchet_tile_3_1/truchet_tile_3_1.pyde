size(1200, 600)
background('#004477')
stroke('#A0A0A0')
strokeWeight(1)

size=25

col = 0
row = 0
for i in range(1, (width*height)/size):
    sc = size * random(0,1)
    if int(random(2)):
        noFill()
    else:
        fill('#F0F0F0')       
    rect(col,row,size,size,sc)
    col += size
    if i % (width/size) ==0:
        row +=size
        col = 0
        
saveFrame("output.png")
