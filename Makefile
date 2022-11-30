all: install

install:
	mkdir ~/.bin
	cp ./gimme-creds ~/.bin/gimme-creds
	echo "Add 'source ~/.bin/gimme-creds' to your zshrc file"
	touch ~/.login_config
	echo "Add profiles to ~/.login_config"

clean:
	rm ~/.bin/gimme-creds
