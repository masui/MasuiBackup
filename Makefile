#
# /Volumes/Masui にマウントされた外部ディスクに色々バックアップする
#

all: pitecan hondana gyazz gyamm gyaki gyaml 3memo quickml masui sfc github

# アップロードファイルもセーブするためgyazz.masuilab.orgでrsyncしている
.PHONY: gyazz
gyazz:
	scp -r masui.sfc.keio.ac.jp:/Users/masui/Gyazz/dump/gyazz .
	-mkdir gyazz.masuilab.org
	cd gyazz.masuilab.org; rsync -avz gyazz.masuilab.org:/Users/masui/Gyazz .
	-mkdir gyazz.com
	cd gyazz.com; rsync -avz --exclude='/access' Gyazz.com:/home/masui/Gyazz .

gyamm:
	-mkdir gyamm.com
	cd gyamm.com; rsync -avz Gyamm.com:/home/masui/Gyamm .
gyaki:
	-mkdir gyaki.com
	cd gyaki.com; rsync -avz Gyaki.com:/home/masui/Gyaki .
3memo:
	-mkdir 3memo.com
	cd 3memo.com; rsync -avz pitecan.com:/www/www.pitecan.com/3memo .
hondana:
	-mkdir hondana.org
	-cd hondana.org; rsync -avz --exclude='*.log' hondana.org:/home/masui/hondana .
	cd hondana.org; rsync -avz --exclude='*.log' hondana.org:/home/masui/hondana-admin .
quickml:
	-mkdir quickml.com
	-cd quickml.com; rsync -avz quickml.com:/home/quickml .
	cd quickml.com; rsync -avz quickml.com:/home/masui .

gyaml:
	-mkdir gyaml.com
	cd gyaml.com; rsync -avz gyaml.com:/Users/masui/QuickML .

pitecan:
	-mkdir pitecan.com
	-cd pitecan.com; rsync -avz pitecan.com:/www/www.pitecan.com .
	-cd pitecan.com; rsync -avz pitecan.com:/home/masui .

#	pass = m2e2r4zxs9
masui:
	-mkdir masui.org
	-mkdir masui.org/masui
	-cd masui.org; rsync -avz masui.org:/home/masui/Memo/db masui/Memo
	-cd masui.org; rsync -avz root@masui.org:/etc .
	cd masui.org; rsync -avz root@masui.org:/usr/local usr

sfc:
	-mkdir masui.sfc
	-cd masui.sfc; rsync -avz \
		--exclude Backup \
		--exclude 'Gyazz*' \
		--exclude Gyamm \
		--exclude .Trash \
		--exclude masui/Library \
		--exclude masui/Photos \
		--exclude '*.log' \
		masui.sfc.keio.ac.jp:/Users/masui .
	cd masui.sfc; rsync -avz masui.sfc.keio.ac.jp:/Volumes/Share/Web/upload Web

air:
	-mkdir MacBookAir2014
	cd MacBookAir2014; rsync -avz \
		--exclude .Trash \
		--exclude Library/Caches \
		--exclude Library/Thunderbird/Profiles/hdmxb5ww.default \
		/Users/masui .

mailbackup:
	rsync -avz pitecan.com:/home/masui/Mail .

github:
	-/bin/rm -r -f github.com
	mkdir github.com
	cd github.com;  git clone https://github.com/masuilab/Gyazz.git;       mv Gyazz GyazzCoffee
	cd github.com;  git clone https://github.com/masui/Gyazz.git
	cd github.com;  git clone https://github.com/masui/Hondana.git
	cd github.com;  git clone https://github.com/masui/Dial.git
	cd github.com;  git clone https://github.com/masui/Slime.git
	cd github.com;  git clone https://github.com/masui/EpisoPass.git
	cd github.com;  git clone https://github.com/masui/IFPsychology.git
	cd github.com;  git clone https://github.com/masui/GyazoLink.git

#	-cd github.com/Gyazz;        git pull git@github.com:masui/Gyazz.git
#	-cd github.com/Hondana;      git pull git@github.com:masui/Hondana.git
#	-cd github.com/Dial;         git pull git@github.com:masui/Dial.git
#	-cd github.com/Slime;        git pull git@github.com:masui/Slime.git
#	-cd github.com/EpisoPass;    git pull git@github.com:masui/EpisoPass.git
#	-cd github.com/IFPsychology; git pull git@github.com:masui/IFPsychology.git

#github2:
#	-cd github.com; /bin/rm -r -f Slime;   git clone git@github.com:masui/Slime.git
#	-cd github.com; /bin/rm -r -f EpisoPass;   git clone git@github.com:masui/EpisoPass.git
#	-cd github.com; /bin/rm -r -f Hondana; git clone git@github.com:masui/Hondana.git
#	-cd github.com; /bin/rm -r -f Dial; git clone git@github.com:masui/Dial.git
