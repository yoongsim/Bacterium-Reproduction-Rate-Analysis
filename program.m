% programme to calculate and display the number of bacteria presented 
% in each culture medium 
% from the beginning until the end of 48 hours

y = 0; % to start the menu
load train % prepare to blow the whistle
sound(y, Fs)% blow the whistle
while y ~= 3
    y = menu('Click on to see the result of bacteria in both culture at the end of 48 hours', 'medium P', ...
        'medium Q', 'Quit' ); % the menu for the user to see the title 
                              % and the options
    if y == 1
        load splat % prepare to hear the firework
        sound(y, Fs) % hear the firework sounds
        
        % Declaring variables
        totalTime = 48; %Total time of experiment for both medium
        interval = 0:1:totalTime; %Time interval for both medium

        rateP = 2; %Reproduction rate in medium P (hours)

        %for every interval, calc the num of times of bacteria generation 
        rP = interval/rateP; %num of generation of bacteria in medium P 
                             %for each interval

        %for every number of generation the bacterium reproduce, 
        %calculate the number of bacterium in medium P
        nP = 1*2.^rP; %number of bacterium in medium P for each interval

        %calculate the total number of bacteria in culture medium P 
        %after 48 hours

        %total num of generation of bacteria in medium P in 48 hours
        total_num_generation_P = totalTime/rateP; %total num of generation 
        
        %total number of bacteria in culture medium P after 48 hours
        mediumP = 2.^total_num_generation_P; 
        
        fprintf('\nTotal number of bacteria in culture medium P:') 
        disp(mediumP) % display total num of bacteria in culture medium P
        disp('Press any key to continue')
       pause
       
    elseif y == 2
        load splat % prepare to hear the firework
        sound(y, Fs) % hear the firework sounds
        
        % Declaring variables
        rateQ = 3; %Reproduction rate in medium Q (hours)

        %for every interval, calc the num of times of bacteria generation 
        rQ = interval/rateQ; %number of generation of bacteria in medium Q 
                             %for each interval

        %for every number of generation the bacterium reproduce, 
        %calculate the number of bacterium in medium Q
        nQ = 1*2.^rQ; %number of bacterium in medium Q for each interval

        %calculate the total number of bacteria in culture medium Q 
        %after 48 hours

        %total num of generation of bacteria in medium Q in 48 hours
        total_num_generation_Q = totalTime/rateQ; 

        %total number of bacteria in culture medium Q after 48 hours
        mediumQ = 2.^total_num_generation_Q; 
        
        fprintf('\nTotal number of bacteria in culture medium Q:')
        disp(mediumQ) % display total num of bacteria in culture medium Q
        disp('Press any key to continue')
       pause
        end
    end
    % Display the number of bacterium for each interval using table
    % Create table for P and Q, transpose variables interval and nP to
    % print the values downwards, with title ('Time_hours',
    % 'No_of_Bacterium_In_P' and 'No_of_Bacterium_In_Q'
    % Floor is used to avoid intermediate num of bacterium 

    tableBacterium =table(interval',floor(nP'),floor(nQ'),...
        'variableNames',{'Time_hours', 'No_of_Bacterium_In_P',...
        'No_of_Bacterium_In_Q'});
    disp(tableBacterium); %display table

    %Plot No. of bacterium against against time taken in hours

    hold

    plot(interval,log(nP),'-r')
    plot(interval,log(nQ),'-b')
    title("Number of Bacterium (log) against Time taken in hours")
    xlabel("Time taken in hours")
    ylabel("Number of Bacterium (log)")
    legend('Medium P','Medium Q')

    hold off

    

    
