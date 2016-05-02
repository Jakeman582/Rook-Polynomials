function [count] = countCells(board)
%countCells Counts the number of non-NaN cells in the given matrix.
%--------------------------------------------------------------------------
%Author: Jacob Hiance
%
%Purpose: Counts the number of non-NaN components of the given matrix.
%
%Inputs:
%board --> The matrix on which to do the count.
%
%Outputs:
%count --> The number of non-NaN components of board.
%
%Required Helper Functions:
%No required helper functions.
%--------------------------------------------------------------------------

   % Initialize the count to 0 because we have not yet counted any
   % non-NaN components.
   count = 0;
   
   % We need to know how many rows and columns over which to iterate.
   [rows,columns] = size(board);
   
   % There are 0 rows or 0 columns, then there is no work to be done
   % because there is no board. Thus, there are 0 non-NaN components.
   if(rows == 0 || columns == 0)
      return;
   end

   % Check each row and column of the board matrix in search of non-NaN
   % components to count.
   for i = 1:rows
      for j = 1:columns
         % If we find a non-NaN component, we need to increment our count.
         if(~isnan(board(i,j)))
            count = count + 1; 
         end
      end
   end
   
end