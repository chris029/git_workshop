function [filtered_signal] = custom_medfilt1(signal, window_length)
% filtered_signal = CUSTOM_MEDFILT1(signal, window_length):
%
% Apply 1D median filter to <signal> using a widow of <window_length> samples.
%
% Parameters:
%    signal - 1D array to be filtered
%    window_length: int defining length of a window; has to be an odd number,
%    cannot be longer than a signal;
% Return:
%    filtered_signal: 1D array
%
% Additional info:
% The window is fixed at lower and upper edge of sample range.
% Example:
% At lower edge (sample_index <= 3), for window_length = 5, the window does not move. 
% For sample_index = 4, the window moves for the firs time to position:
% sample_index - 2 (2) and sample_index + 2 (6) -> window_length = 5. 
% The same applies to upper edge.
%
% Author:
% Krzysztof Huptys, 17.11.22

verify_input(signal, window_length)

half_window = floor(window_length / 2);
signal_length = length(signal);

filtered_signal = zeros(1, length(signal));

for i = 1 : signal_length
    % create vecotr of indexes for samples to calculte median for
    if half_window < i && i <= signal_length - half_window
        % in the middle of sample range
        start_index = i - half_window;
        end_index = i + half_window;

    elseif i <= half_window
        % at the lower edge of sample range
        start_index = i;
        end_index = window_length - 1;

    elseif i > signal_length - half_window
        % at the upper edge of sample range
        start_index = signal_length - window_length + 1;
        end_index = signal_length;

    else
        waring("Something's wrong with median filtering. Debugging is required.")
    
    end

    index_vector = start_index : end_index;

    % pick signal samples and calculate median
    filtered_signal(i) = median(signal(index_vector));
end


function verify_input(signal, window)
assert( ...
    isvector(signal), ...
    'custom_medfilt1:inputSignalNotAVectorError', ...
    'Input signal is not a 1D array (vector).' ...
    )
assert( ...
    mod(window, 2), ...
    'custom_medfilt1:windowDimensionError', ...
    'Window size must be odd.' ...
    )
assert( ...
    length(signal) > window, ...
    'custom_medfilt1:inputSignalTooShortError', ...
    'Input signal vector is too short for this window size.' ...
    )

