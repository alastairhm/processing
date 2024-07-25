def shapeBL(col,row,size):
    line(col, row, col+size, row+size)    
    
def shapeTL(col,row,size):
    line(col, row+size, col+size, row)    

def randomStroke(alpha):
    stroke(random(255),random(255),random(255),alpha)
    
def paint():
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
            
size(1200, 600)
background('#0')
tSize=25
strokeWeight(6)
strokeCap(ROUND)
for i in range(0,3):
    randomStroke(64*(i+1))
    paint()        
saveFrame("output.png")
