#!/bin/bash
PATH=$PATH:/bin:/usr/bin:/usr/sbin:/usr/local/bin
export PATH
BASEDIR=$(dirname $0)
#RADIO_ADDR="rtmp://ebsandroid.ebs.co.kr:1935/fmradiofamilypc/familypc1m"
RADIO_ADDR="rtsp://new_iradio.ebs.co.kr/iradio/iradiolive_m4a"
RADIO_NAME="ebs_radio"

if [ $# -lt 3 ] 
  then
  echo $0": insufficient arguement!"
  echo "usage: $0 [program name without blank] [recording_time(min)] [will saved target directory]"
  exit 1
fi

PROGRAM_NAME=$1
RECORD_MINS=$(($2 * 60))
DEST_DIR=$3
mkdir -p $DEST_DIR

REC_DATE=`/bin/date +%Y%m%d-%H%M`
echo $REC_DATE
FILE_NAME="${DEST_DIR}/${REC_DATE}_${PROGRAM_NAME}"

FLV_FILE_NAME="$FILE_NAME.flv"
WAV_FILE_NAME="$FILE_NAME.wav"
MP3_FILE_NAME="$FILE_NAME.mp3"

echo "$FLV_FILE_NAME"
echo "$WAV_FILE_NAME"
echo "$MP3_FILE_NAME"

rtmpdump -r $RADIO_ADDR -o $FLV_FILE_NAME > /dev/null 2>&1 &
pid_player=$!
#echo "PID : $pid_player"
sleep $RECORD_MINS
kill  $pid_player

ffmpeg -i $FLV_FILE_NAME -acodec pcm_s16le -ac 2 -ab 128 -vn -y $WAV_FILE_NAME > /dev/null 2>&1 
lame -h $WAV_FILE_NAME $MP3_FILE_NAME > /dev/null 2>&1

rm -f $FLV_FILE_NAME
rm -f $WAV_FILE_NAME

#mkdir -p $DEST_DIR
#mv $MP3_FILE_NAME $DEST_DIR
