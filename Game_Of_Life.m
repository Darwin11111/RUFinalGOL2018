function [finalMat] = Game_Of_Life(mat, n)
    
%defining useful functions
    %returns the number of nieghbors (vertical, horizontal, and diagonal)
    function [num] = neighbors(game, x1, y1)
        num = 1;
        if x1 > 1
            if y1 > 1
                
            else
                
            end 
        else
            if y1 > 1
                
            else
                
            end 
        end
    end
    
    %updating function that runs every iteration
    function [fMat] = gameItr(FMat)
       [r, c] = size(FMat);
       
       for y = 1:1:r
           for x = 1:1:c
               
           end
       end
    end

    %clean up output and display the original board state
    clc;
    disp("");
    disp(['The original game state with ', num2str(n), ' iterations']);
    disp(mat);

    %preserving the original input data
    finalMat = mat;
    
    %primary game loop
    for i = 1:1:n
        
        %updating function
%         finalMat = gameItr(finalMat); %still in development
        
        %ouputing the current game state for easy debugging and it looks
                                    %cool
        disp("-----------------------------------------------");
        disp(['Iteration(s): ', num2str(i)]);
        disp('Current Game State: ');
        disp(finalMat);
    end
end
