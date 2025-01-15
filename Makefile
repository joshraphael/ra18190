SHELL := /bin/bash
export cwd = $(shell pwd)
export RATOOLS_DIR = ~/Installs/RATools-v1.15.0
export RALIBRETRO_DIR = ~/Installs/RALibretro-x64
export GAME_ID = 18190
export EUROPE = NPEZ00358WIMH00
export USA = NPUZ00243WIMH00

compile:
	touch ${RALIBRETRO_DIR}/RACache/Data/${GAME_ID}.json
	wine ${RATOOLS_DIR}/rascript-cli.exe -i ${GAME_ID}.rascript -o ${RALIBRETRO_DIR}

load:
	if [ -z "${chapter}" ]; then echo "empty chapter selected during load"; exit 1; fi;
	if [[ ${chapter} != @(1|2|3|4|5|6|7|8|9|10|11|12) ]]; then echo "invalid chapter selected to load: ${chapter}"; exit 1; fi;
	if [[ ! -d saves/chapter${chapter} ]]; then echo "saves/chapter${chapter} directory missing"; exit 1; fi;
	if [[ ! -f saves/chapter${chapter}/PARAM.SFO ]]; then echo "saves/chapter${chapter}/PARAM.SFO file missing"; exit 1; fi;
	if [[ ! -f saves/chapter${chapter}/SAVE.S ]]; then echo "saves/chapter${chapter}/SAVE.S file missing"; exit 1; fi;
	rm -rf ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${EUROPE}
	rm -rf ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${USA}
	mkdir -p ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${EUROPE}
	mkdir -p ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${USA}
	cp assets/ICON0.PNG ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${EUROPE}
	cp assets/ICON0.PNG ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${USA}
	cp saves/chapter${chapter}/PARAM.SFO ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${EUROPE}
	cp saves/chapter${chapter}/PARAM.SFO ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${USA}
	cp saves/chapter${chapter}/SAVE.S ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${EUROPE}
	cp saves/chapter${chapter}/SAVE.S ${RALIBRETRO_DIR}/Saves/PSP/SAVEDATA/${USA}