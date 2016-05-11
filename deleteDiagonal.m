function [newBoard] = deleteDiagonal(board, x, y, deltaX, deltaY)
%deleteDiagonal Deletes elements along the same diagonals as cell (x,y).
%--------------------------------------------------------------------------
%Author: Jacob Hiance
%
%Purpose: Deletes cells that lie on the same two diagonals on which cell
%         (x,y) lies. A stepsize in x and a step size in y can be specified to
%         determine the 'slope' of the diagonal that is deleted. A cell is
%         deleted by setting its value to NaN.
%
%Inputs:
%  board --> The matrix on which to do the search.
%  x --> The row of the cell by which to base the diagonal deletion.
%  y --> The column of the cell by which to base the diagonal deletion.
%  deltaX --> The horizontal step size determining how many columns to skip
%             in diagonal deletion.
%  deltay --> The vertical step size determining how many rows to skip in 
%             diagonal deletion.
%
%Outputs:
%  newBoard --> A matrix resulting from deleting the specified diagonals of
%               the given board matrix.
%
%Required Helper Functions:
%No required helper functions.
%--------------------------------------------------------------------------

   % Initialize newBoard so it can besafely returned if it turns out that
   % no diagonals are to be deleted.
   newBoard = board;
   
   % We need to know how many rows and columns over which to iterate.
   [rows,columns] = size(newBoard);
   
   % Start by deleting the diagonal going in the top-right direction as
   % specified by deltaX and deltaY.
   i = x;
   j = y;
   while( i > 0 && i < (rows + 1) && j > 0 && j < (columns + 1) )
      newBoard(i,j) = NaN;
      i = i + deltaX;
      j = j + deltaY;
   end
   
   % Next, delete the diagonal going in the top-left direction as
   % specified by deltaX and deltaY.
   i = x;
   j = y;
   while( i > 0 && i < (rows + 1) && j > 0 && j < (columns + 1) )
      newBoard(i,j) = NaN;
      i = i - deltaX;
      j = j + deltaY;
   end
   
   % Next, delete the diagonal going in the bottom-right direction as
   % specified by deltaX and deltaY.
   i = x;
   j = y;
   while( i > 0 && i < (rows + 1) && j > 0 && j < (columns + 1) )
      newBoard(i,j) = NaN;
      i = i + deltaX;
      j = j - deltaY;
   end
   
   % Finally, delete the diagonal going in the bottom-left direction as
   % specified by deltaX and deltaY.
   i = x;
   j = y;
   while( i > 0 && i < (rows + 1) && j > 0 && j < (columns + 1) )
      newBoard(i,j) = NaN;
      i = i - deltaX;
      j = j - deltaY;
   end
   
end
