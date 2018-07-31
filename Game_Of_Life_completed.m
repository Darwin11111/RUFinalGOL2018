function [finalMat] = Game_Of_Life_completed(mat, n)
    
%defining useful functions
    %returns the number of nieghbors (vertical, horizontal, and diagonal)
    function [num] = neighbors(game, x1, y1)
        [yMax, xMax] = size(game);
        
        %checking if this guy is alive
        if game(y1, x1) == 1
            num = 1;
        else
            num = 0;
        end
        
        %tinder for neighbors
        if x1 > 1
            if x1 < xMax
                if y1 > 1
                    if y1 < yMax
                        if game(y1 + 1, x1) == 1 
                            num = num + 1;
                        end
                        if game(y1 - 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    else
                        if game(y1 - 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    end
                else
                    if y1 < yMax
                        if game(y1 + 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    else
                        if game(y1, x1 + 1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    end
                end 
            else
                if y1 > 1
                    if y1 < yMax
                        if game(y1 + 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    else
                        if game(y1 - 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 - 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    end
                else
                    if y1 < yMax
                        if game(y1 + 1, x1) == 1  
                            num = num + 1;
                        end
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    else
                        if game(y1, x1 - 1) == 1  
                            num = num + 1;
                        end
                        if game(y1 + 1, x1 - 1) == 1  
                            num = num + 1;
                        end
                    end
                end 
            end
        else
            if y1 > 1
                if y1 < yMax
                    if game(y1 + 1, x1) == 1  
                        num = num + 1; 
                    end
                    if game(y1 - 1, x1) == 1  
                        num = num + 1;
                    end
                    if game(y1, x1 + 1) == 1  
                        num = num + 1;
                    end
                    if game(y1 + 1, x1 + 1) == 1  
                        num = num + 1;
                    end
                    if game(y1 - 1, x1 + 1) == 1  
                        num = num + 1;
                    end
                else
                    if game(y1 - 1, x1) == 1  
                        num = num + 1;
                    end
                    if game(y1, x1 + 1) == 1  
                        num = num + 1;
                    end
                    if game(y1 - 1, x1 + 1) == 1  
                        num = num + 1;
                    end
                end
            else
                if game(y1 + 1, x1) == 1 
                    num = num + 1;
                end
                if game(y1, x1 + 1) == 1  
                    num = num + 1;
                end
                if game(y1 + 1, x1 + 1) == 1  
                    num = num + 1;
                end
            end 
        end
    end
    
    %confirming that we aren't changing the same value twice
    function [tf] = searcher(arrr, c1, c2)
        [yMax, nouse] = size(arrr);
        tf = false;
        for y1 = 1:1:yMax
            if arrr(y1, 1) == c1 && arrr(y1, nouse) == c2
                tf = true;
            end
        end
    end
    %updating function that runs every iteration
    function [fMat] = gameItr(FMat)
       [r, c] = size(FMat);
       
       i1 = 1;
       update = zeros(r*c, 2);
       fMat = FMat;
       
       %check whole board
       for y = 1:1:r
           for x = 1:1:c
               %neighbors calculation
               n1 = neighbors(fMat, x, y);
               
               %game rules to determine updated status next round
                if fMat(y, x) == 1
                    if ~(n1 == 3 || n1 == 4)
                        if searcher(update, y, x) ~= true
                            update(i1, 1) = y;
                            update(i1, 2) = x;
                            i1 = i1 + 1;
                        end
                    end
                else
                    if n1 == 3
                        if searcher(update, y, x) ~= true
                            update(i1, 1) = y;
                            update(i1, 2) = x;
                            i1 = i1 + 1;
                        end
                    end
                end
           end
       end
       
       %update all the values
       for y = 1:1:r*c
            if update(y, 1) ~= 0 || update(y, 2) ~= 0
                if(fMat(update(y, 1), update(y, 2)) == 1)
                    fMat(update(y, 1), update(y, 2)) = 0;
                else
                    fMat(update(y, 1), update(y, 2)) = 1;
                end
            end
       end
    end

    %clean up output and display the original board state
    clc;
    disp("");
    disp(['The original game state with ', num2str(n), ' iterations to do']);
    disp(mat);

    %preserving the original input data
    finalMat = mat;
    
    %primary game loop
    for i = 1:1:n
        
        %updating function
        finalMat = gameItr(finalMat); %still in development
        
        %ouputing the current game state for easy debugging and it looks
                                    %cool
        disp("-----------------------------------------------");
        disp(['Iteration(s): ', num2str(i)]);
        disp('Current Game State: ');
        disp(finalMat);
    end
    
    disp("-----------------------------------------------");
end
