function save_fig_as_graphics(file_path)
%SAVE_FIG_AS_GRAPHICS Save a generated figure as graphic file
%   path - string: defines location of a graphic file

arguments
    file_path string
end

dlgTitle = 'Save as...';
dlgQuestion = 'Do you want to save this figure to jpg?';
user_choice = questdlg(dlgQuestion, dlgTitle, 'Yes', 'No', 'Yes');

switch user_choice
    case 'Yes'
        set( ...
            gcf, ...
            'Units', 'Normalized', ...
            'JavaFrame', 'Maximized', ...
            'PaperUnits', 'centimeters' ...
            );
        saveas(gcf, file_path, 'jpg');

    case 'No'
        % do nothing
end
end

