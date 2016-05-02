%#ok<*NOPTS>
board = [0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0;
         0,0,0,0,0,0,0,0];
      
[rows, columns] = size(board);
time = zeros(rows,columns);

for i = 1:rows
   for j = 1:columns
      tic;
      rookPoly(board(1:i,1:j));
      time(i,j) = toc;
   end
end

time
surf(time)
%xlswrite('CalcRookPoly.csv',time);