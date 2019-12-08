x1 = input('Input the x of the first point: ');
y1 = input('Input the y of the first point: ');
x2 = input('Input the x of the second point: ');
y2 = input('Input the y of the second point: ');
x3 = input('Input the x of the third point: ');
y3 = input('Input the y of the third point: ');

if x1 == x2
    error 'Given points cannot cannot lie on the same circle!'
else
    Mab = (y2 - y1)/(x2 - x1); 
    if x2 == x3
        error 'Given points cannot cannot lie on the same circle!'
    else
        Mbc = (y3 - y2)/(x3 - x2);
        if Mab == Mbc
            error 'Given points cannot cannot lie on the same circle!'
        else
            if Mab == 0
                P1x = x1;
                P1y = y1;
                P2x = x3;
                P2y = y3;
                P3x = x2;
                P3y = y2;
            else
                P1x = x1;
                P1y = y1;
                P2x = x2;
                P2y = y2;
                P3x = x3;
                P3y = y3;
            end
        end
    end
end

%For Cramer's Rule
const1 = 1*(P1x^2 + P1y^2); 
const2 = 1*(P2x^2 + P2y^2); 
const3 = 1*(P3x^2 + P3y^2); 

matrix = [P1x,P1y,1;P2x,P2y,1;P3x,P3y,1];
D = det(matrix);
matrix1 = [const1,P1y,1;const2,P2y,1;const3,P3y,1];
matrix2 = [P1x,const1,1;P2x,const2,1;P3x,const3,1];
matrix3 = [P1x,P1y,const1;P2x,P2y,const2;P3x,P3y,const3];
D1 = -det(matrix1);
D2 = det(matrix2);
D3 = -det(matrix3);

%Vectors
d = D1/D;
e = -1*D2/D;
f = D3/D;

%Coordinates of the Center and Radius
Cx = -1*D1/(D*2); 
Cy = 1*D2/(D*2); 
r = sqrt(((D1^2) + (D2^2) - (4*D*D3))/(4*(D^2))); 

fprintf('Center(%.f,%.f) \n',Cx,Cy);
fprintf('The Radius is %.f \n',r);
fprintf('Vector [%.f,%.f,%.f] \n',d,e,f);