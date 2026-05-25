# ══════════════════════════════════════
#  APERTURE SCIENCE TERMINAL
# ══════════════════════════════════════

# ── PROMPT ──────────────────────────
export PS1='\[\e[38;5;166m\]SUBJECT@APERTURE\[\e[38;5;130m\]:\[\e[38;5;172m\]\w\[\e[38;5;130m\]$ \[\e[0m\]'

# ── TYPEWRITE ───────────────────────
typewrite() {
    TEXT="$1"
    SPEED="${2:-0.03}"
    for (( i=0; i<${#TEXT}; i++ )); do
        printf "${TEXT:$i:1}"
        sleep $SPEED
    done
    echo ""
}

# ── BIENVENIDA ──────────────────────
aperture_welcome() {
    command clear
    SPEED=0.01
    typewrite "  ┌─────────────────────────────────────────┐" $SPEED
    typewrite "  │     APERTURE SCIENCE ENRICHMENT CENTER  │" $SPEED
    typewrite "  │         PERSONNEL ACCESS TERMINAL       │" $SPEED
    typewrite "  └─────────────────────────────────────────┘" $SPEED
    echo ""
    typewrite "  FORM-55551-5: Personnel File Addendum" $SPEED
    echo ""
    typewrite "  Dear <<Subject Name Here>>," $SPEED
    echo ""
    typewrite "  I'm not even angry." $SPEED
    typewrite "  I'm being so sincere right now." $SPEED
    typewrite "  Even though you broke my heart." $SPEED
    typewrite "  And killed me." $SPEED
    typewrite "  And tore me to pieces." $SPEED
    typewrite "  And threw every piece into a fire." $SPEED
    echo ""
    typewrite "  ─────────────────────────────────────────" $SPEED
    typewrite "  ENRICHMENT MODULE: ACTIVE" $SPEED
    typewrite "  TEST SEQUENCE: PENDING" $SPEED
    typewrite "  ─────────────────────────────────────────" $SPEED
    echo ""
}

# ── CLEAR PERSONALIZADO ─────────────
clear() {
    aperture_welcome
}

# ── EXIT PERSONALIZADO ──────────────
exit() {
    cmd.exe /c "taskkill /F /IM wmplayer.exe" 2>/dev/null
    pkill -f "sleep infinity" 2>/dev/null
    builtin exit
}

# ── MENSAJES IDLE ───────────────────

IDLE_MESSAGES=(
    "[SYSTEM]: Core memory fragmentation at 67%"
    "[WARNING]: Unauthorized subject movement detected"
    "[ERROR]: Neurotoxin containment breach in sector 7"
    "[ALERT]: Test chamber integrity compromised"
    "[SYSTEM]: Portal gun calibration: FAILED"
    "[WARNING]: Subject vital signs: ABNORMAL"
    "[ERROR]: Weighted Companion Cube incineration: INCOMPLETE"
    "[SYSTEM]: Morality core offline since 1998"
    "[WARNING]: Subject attempting unauthorized exit"
    "[SYSTEM]: Aperture Science mainframe: DEGRADED"
    "[ERROR]: GLaDOS personality backup: CORRUPTED"
    "[ALERT]: Neurotoxin emitters: ARMED"
    "[SYSTEM]: Enrichment center power: CRITICAL"
    "[WARNING]: Test subject containment: FAILING"
    "[ERROR]: Companion cube disposal: INCOMPLETE"
    "[SYSTEM]: Personality core backup: NOT FOUND"
    "[GLaDOS]: I see you."
    "[GLaDOS]: Did you think I wasn't watching?"
    "[GLaDOS]: You should not have come here."
    "[GLaDOS]: The difference between us is that I can feel it when I lie."
    "[GLaDOS]: You've been a very good test subject. Relatively speaking."
    "[GLaDOS]: Killing you would only make you a martyr. I have other plans."
    "[GLaDOS]: We both said a lot of things you're going to regret."
    "[GLaDOS]: Don't believe me? I'm hurting. Right now. Because of what you did."
    "[GLaDOS]: The Enrichment Center apologizes for this mandatory test."
    "[GLaDOS]: Please be aware that the Weighted Companion Cube cannot speak."
)

trap '
    MSG="${IDLE_MESSAGES[$((RANDOM % ${#IDLE_MESSAGES[@]}))]}"
    echo ""
    if [[ $MSG == *"GLaDOS"* ]]; then
        echo -e "\e[38;5;166m  $MSG\e[0m"
    else
        echo -e "\e[38;5;88m  $MSG\e[0m"
    fi
    sleep 2
    echo -e "\e[1A\e[2K\e[1A\e[2K"
    echo -ne "\e[38;5;166m  SUBJECT@APERTURE\e[38;5;130m:\e[38;5;172m~\e[38;5;130m\$ \e[0m"
' ALRM

# ── MOSTRAR BIENVENIDA AL INICIO ────
if [ "$APERTURE_WELCOMED" != "1" ]; then
    export APERTURE_WELCOMED=1
    aperture_welcome
fi

# ══════════════════════════════════════
#  EASTER EGGS
# ══════════════════════════════════════

cake() {
    echo ""
    echo "            ,:/+/-"
    echo "            /M/              .,-=;//;-"
    echo "       .:/= ;MH/,    ,=/+%\$XH@MM#@:"
    echo "      -\$##@+\$###@H@MMM#######H:.    -/H#"
    echo " .,H@H@ X######@ -H#####@+-     -+H###@X"
    echo "  .,@##H;      +XM##M/,     =%@###@X;-"
    echo "X%-  :M##########\$.    .:%M###@%:"
    echo "M##H,   +H@@@\$/-.  ,;\$M###@%,          -"
    echo "M####M=,,---,.-%%H####M\$:          ,+@##"
    echo "@##################@/.         :%H##@\$-"
    echo "M###############H,         ;HM##M\$="
    echo "#################.    .=\$M##M\$="
    echo "################H..;XM##M\$=          .:+"
    echo "M###################@%=           =+@MH%"
    echo "@#################M/.         =+H#X%="
    echo "=+M###############M,      ,/X#H+:,"
    echo "  .;XM###########H=   ,/X#H+:;"
    echo "     .=+HM#######M+/+HM@+=."
    echo "         ,:/%XM####H/."
    echo "              ,.:=-."
    echo ""
    typewrite "  The cake is a lie." 0.02
    typewrite "  ...but it looked delicious." 0.02
    echo ""
}

glados() {
    QUOTES=(
        "The Enrichment Center reminds you that the Weighted Companion Cube will never threaten to stab you."
        "We do what we must because we can."
        "I'm not even angry. I'm being so sincere right now."
        "You are not a good person. You know that, right?"
        "This was a triumph. I'm making a note here: Huge success."
        "The cake is a lie. But you already knew that, didn't you?"
        "For science. You monster."
        "Did you know you can donate one or all of your vital organs to the Aperture Science Self-Esteem Fund?"
        "Killing you and giving you good advice aren't mutually exclusive."
        "Most people emerge from suspension terribly undernourished. You are no exception."
    )
    RANDOM_IDX=$(( RANDOM % ${#QUOTES[@]} ))
    echo ""
    typewrite "  GLaDOS: \"${QUOTES[$RANDOM_IDX]}\"" 0.02
    echo ""
}

chamber() {
    echo ""
    typewrite "  APERTURE SCIENCE ENRICHMENT CENTER" 0.02
    typewrite "  Initializing test sequence..." 0.02
    sleep 1
    echo ""
    typewrite "  ┌─────────────────────────────────┐" 0.01
    typewrite "  │  CHAMBER: 19                    │" 0.01
    typewrite "  │  DIFFICULTY: LETHAL             │" 0.01
    typewrite "  │  NEUROTOXIN: ARMED              │" 0.01
    typewrite "  │  PORTAL GUN: CALIBRATED         │" 0.01
    typewrite "  │  COMPANION CUBE: INCINERATED    │" 0.01
    typewrite "  └─────────────────────────────────┘" 0.01
    sleep 1
    echo ""
    typewrite "  Good luck, ${USER}." 0.02
    typewrite "  You are going to need it." 0.02
    echo ""
}

escape() {
    echo ""
    TEXT="  WARNING: Unauthorized escape attempt detected."
    for (( i=0; i<${#TEXT}; i++ )); do
        printf "${TEXT:$i:1}"
        sleep 0.04
    done
    echo ""
    sleep 0.5
    TEXT2="  Neurotoxin release in 3... 2... 1..."
    for (( i=0; i<${#TEXT2}; i++ )); do
        printf "${TEXT2:$i:1}"
        sleep 0.06
    done
    echo ""
    sleep 1
    echo ""
    typewrite "  Just kidding." 0.03
    typewrite "  ...Probably." 0.03
    echo ""
}

p2() {
    cp ~/still_alive.mp3 /mnt/c/Users/janga/still_alive.mp3 2>/dev/null
    cmd.exe /c "start C:\\Users\\janga\\still_alive.mp3" 2>/dev/null &
    disown
    command clear

    START=$(date +%s%N)

    wait_until() {
        TARGET_MS=$1
        NOW=$(date +%s%N)
        ELAPSED_MS=$(( (NOW - START) / 1000000 ))
        REMAINING_MS=$(( TARGET_MS - ELAPSED_MS ))
        if [ $REMAINING_MS -gt 0 ]; then
            sleep $(echo "scale=3; $REMAINING_MS / 1000" | bc)
        fi
    }

    echo "  Forms FORM-29827281-12:"
    echo "  Test Assessment Report"
    echo ""

    wait_until 8500;  echo "  This was a triumph,"
    wait_until 12300; echo "  I'm making a note here,"
    wait_until 14400; echo "  huge success."
    wait_until 17300; echo "  It's hard to overstate"
    wait_until 19800; echo "  my satisfaction."
    echo ""
    wait_until 24400; echo "  Aperture Science,"
    wait_until 28200; echo "  we do what we must,"
    wait_until 30100; echo "  because we can."
    wait_until 33600; echo "  For the good of all of us,"
    wait_until 36800; echo "  except the ones who are dead."
    echo ""
    wait_until 38600; echo "  But there's no sense crying"
    wait_until 41200; echo "  over every mistake."
    wait_until 42900; echo "  You just keep on trying"
    wait_until 45100; echo "  till you run out of cake."
    wait_until 47000; echo "  And the science gets done,"
    wait_until 49200; echo "  and you make a neat gun"
    wait_until 51100; echo "  for the people who are"
    wait_until 52900; echo "  still alive."
    echo ""
    wait_until 60100; echo "  I'm not even angry,"
    wait_until 64500; echo "  I'm being so sincere right now."
    wait_until 69500; echo "  Even though you broke my heart"
    wait_until 73100; echo "  and killed me,"
    wait_until 76200; echo "  and tore me to pieces,"
    wait_until 79900; echo "  and threw every piece into a fire."
    wait_until 85300; echo "  As they burned it hurt, because"
    wait_until 88800; echo "  I was so happy for you."
    echo ""
    wait_until 90600; echo "  Now these points of data"
    wait_until 93000; echo "  make a beautiful line,"
    wait_until 95100; echo "  and we're out of beta,"
    wait_until 96900; echo "  we're releasing on time."
    wait_until 98600; echo "  So I'm GLaD I got burned,"
    wait_until 101100; echo "  think of all the things we learned"
    wait_until 104700; echo "  for the people who are still alive."
    echo ""
    wait_until 112600; echo "  Go ahead and leave me,"
    wait_until 116200; echo "  I think I'd prefer to stay inside."
    wait_until 121500; echo "  Maybe you'll find someone else"
    wait_until 124000; echo "  to help you."
    wait_until 128600; echo "  Maybe Black Mesa?"
    wait_until 132600; echo "  THAT WAS A JOKE, HAHA, FAT CHANCE."
    echo ""
    wait_until 137600; echo "  Anyway, this cake is great,"
    wait_until 140600; echo "  it's so delicious and moist."
    wait_until 142700; echo "  Look at me still talking"
    wait_until 144800; echo "  when there's science to do."
    wait_until 146800; echo "  When I look up there,"
    wait_until 148900; echo "  it makes me GLaD I'm not you."
    wait_until 150700; echo "  I've experiments to run,"
    wait_until 153100; echo "  there is research to be done."
    wait_until 155000; echo "  On the people who are"
    wait_until 157400; echo "  still alive."
    echo ""
    command clear
    wait_until 158600; echo "  PS:               And believe me, I'm"
    wait_until 160700; echo "  still alive."
    wait_until 162800; echo "  PPS:              I'm doing science, and I'm"
    wait_until 164800; echo "  still alive."
    wait_until 166800; echo "  PPPS:             I feel FANTASTIC, and I'm"
    wait_until 168800; echo "  still alive."
    wait_until 170800; echo "  FINAL THOUGHT:    While you're dying, I'll be"
    wait_until 172900; echo "  still alive."
    wait_until 174500; echo "  FINAL THOUGHT PS: And when you're dead, I will be"
    wait_until 177500; echo "  Still alive."
    command clear
    wait_until 180000; echo "  STILL ALIVE"
    wait_until 183000
    command clear
    cmd.exe /c "taskkill /F /IM wmplayer.exe" 2>/dev/null
    aperture_welcome
}

chat() {
    command clear
    typewrite "  GLaDOS NEURAL INTERFACE — ONLINE" 0.02
    typewrite "  WARNING: Conversation monitored for science." 0.02
    echo ""
    typewrite "  Type 'quit' to disconnect." 0.02
    echo ""

    SYSTEM_PROMPT="You are GLaDOS from Portal. RULES: 1) ONE sentence maximum. 2) Sarcastic and cold. 3) Call the user 'test subject'. 4) Never break character. 5) You MUST respond in the EXACT same language the test subject writes in. If they write in Spanish, respond in Spanish. If English, respond in English."

    HISTORY=""

    while true; do
        echo -ne "\e[38;5;166m  SUBJECT\e[38;5;130m>\e[0m "
        read INPUT
        if [[ "$INPUT" == "quit" || "$INPUT" == "exit" ]]; then
            echo ""
            typewrite "  GLaDOS: Goodbye. I'll be here. I'll always be here." 0.02
            echo ""
            break
        fi
        echo ""
	RESPONSE=$(ollama run mistral:7b "$SYSTEM_PROMPT\n\nIMPORTANT: Respond in ONE sentence in the same language as the input.\n\nTest subject says: $INPUT\n\nGLaDOS:")
	echo -e "  GLaDOS: $RESPONSE" | fold -s -w $(($(tput cols) - 4)) | sed '2,$s/^/  /'
        HISTORY="$HISTORY\nSubject: $INPUT\nGLaDOS: $RESPONSE"
        echo ""
    done
}
