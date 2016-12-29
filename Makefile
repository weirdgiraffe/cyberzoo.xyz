build:
	hugo

all:
	hugo --buildDrafts

clean:
	$(RM) -r public/*

serve:
	hugo serve

serveall:
	hugo serve --buildDrafts

deploy:
	rsync -avz -e ssh -r public/* cyberzoo.xyz:www
