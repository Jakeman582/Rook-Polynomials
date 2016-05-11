function [first] = findFirst(board)
%findFirst Finds the first non-NaN component of a given matrix.
%--------------------------------------------------------------------------
%Author: Jacob Hiance
%
%Purpose: Finds the first non-NaN component of the given matrix. This
%         function performs a row-major search.
%
%Inputs:
%  board --> The matrix on which to do the search.
%
%Outputs:
%  first --> A 1 by 2 vector [i,j] where row i and column j hold the first
%            non-NaN component of the given matrix.
%
%Required Helper Functions:
%No required helper functions.
%--------------------------------------------------------------------------

   % In case of an unsuccessful search, initialize first to NaN.
   first = NaN;

   % We need to stop searching when we find the first non-NaN component.
   foundFirst = 0;
   
   % We need to know how many rows and columns over which to iterate.
   [rows,columns] = size(board);
   
   % Search each row for the first non-NaN component.
   for i = 1:rows
      for j = 1:columns
         % As soon as we find the first non-NaN component, stop searching.
         if( ~isnan(board(i,j)) && foundFirst == 0)
            foundFirst = 1;
            first = [i,j];
         end
      end
   end

end
