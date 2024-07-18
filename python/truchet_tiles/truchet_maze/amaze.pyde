size(1200, 600)
background('#0')
tSize=25
strokeWeight(4)
strokeCap(ROUND)
stroke("#FFFFFF")

def shapeBL(col,row,size):
    line(col, row, col+size, row+size)    
    
def shapeTL(col,row,size):
    line(col, row+size, col+size, row)    

col = 0
row = 0
for i in range(1, (width*height)/tSize):
    r = int(random(2))
    if r == 0:
        shapeBL(col,row,tSize)
    else:
        shapeTL(col,row,tSize)
    col += tSize
    if i % (width/tSize) ==0:
        row +=tSize
        col = 0
        
saveFrame("output.png")
        
