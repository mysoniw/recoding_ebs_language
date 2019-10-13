# recoding_ebs_language
rtsp streaming radio to mp3 file

## It's easy to explain this in shell
```shell
./ebs_rec.sh [program name without blank] [recording_time(min)] [will saved target directory]
```

## What you need
- OSX Yosemite 10.10.5
- rtmpdump (brew install rtmpdump)
- ffmpeg (brew install ffmpeg)
- lame (brew install lame)

*If you don't installed brew, [here](http://brew.sh/index_ko.html) is the tutorial*

## Regist crontab

```shell
crontab -e
50 5 * * 1-6 ~/ebs/ebs_rec.sh Pocket 10 /Volumes/BackUp/english/mp3
20 6 * * 1-6 ~/ebs/ebs_rec.sh EasyWriting 20 /Volumes/BackUp/english/mp3
```

* [EBS외국어라디오편성표](http://www.ebs.co.kr/schedule?channelCd=IRADIO&onor=IRADIO)


