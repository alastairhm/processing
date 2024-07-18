size(1200, 600)
background('#0')
noStroke()
tSize=25

def shapeBL(col,row,size):
    triangle(col, row, col, row+size, col+size, row+size)    
    
def shapeTL(col,row,size):
    triangle(col, row, col+size, row, col, row+size)    

def shapeTR(col,row,size):
    triangle(col, row, col+size, row, col+size, row+size)

def shapeBR(col,row,size):
    triangle(col+size , row, col+size, row+size, col, row+size)

col = 0
row = 0
for i in range(1, (width*height)/tSize):
    fill(55+random(200),0,0)
    r = int(random(4))
    if r == 0:
        shapeBL(col,row,tSize)
    elif r == 1:
        shapeTL(col,row,tSize)
    elif r == 2:
        shapeBR(col,row,tSize)
    else:
        shapeTR(col,row,tSize)
    col += tSize
    if i % (width/tSize) ==0:
        row +=tSize
        col = 0
        
saveFrame("output.png")
        
