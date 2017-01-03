function is_ubuntu --description 'Check if the system runs Ubuntu'
	if muffle command -s lsb_release
        test (lsb_release -is) = "Ubuntu"
    end
end
