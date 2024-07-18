size(1200, 600)
background('#004477')
fill('#F0F0F0')
stroke('#A0A0A0')
strokeWeight(1)

size=25

col = 0
row = 0
sp = size /2
sr = size * 0.75
sc = size * 0.5
for i in range(1, (width*height)/size):
    if int(random(2)):
        circle(col+sp,row+sp,sr)
    else:
        rect(col,row,size,size,sc,sc,sc,sc)
    col += size
    if i % (width/size) ==0:
        row +=size
        col = 0
        
saveFrame("output.png")
        
