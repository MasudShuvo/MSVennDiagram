# MSVennDiagram
Implement a venn diagram using objective C.

# Implementation
Add MSSet.h, MSSet.m, MSVennDiagram.h, MSVennDiagram.m files to your project. 

Initiate an object of MSVennDiagram class, and add the view where you want to display the diagram.

# Sample code
```
MSVennDiagram *vennDiagram = [[MSVennDiagram alloc] init];
self.vennDiagram.frame = CGRectMake(80, 150, self.vennDiagram.frame.size.width, self.vennDiagram.frame.size.height);

[self.vennDiagram vennDiagramForSetA:100 setB:100 setAintersectB:50];
[yourView addSubview:self.vennDiagram];
```
# Screen shot
![image](https://raw.githubusercontent.com/MasudShuvo/MSVennDiagram/master/ScreenShot/vennDiagram.png)
