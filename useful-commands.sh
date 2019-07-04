ansible-playbook -i "localhost," -c local --extra-vars "user=tom.pride" /home/ubuntu/ansible/playbooks/openvpn/create-client-access.yml

aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
aws ec2 detach-volume --volume-id vol-3d9650f0

aws ec2 create-snapshot --volume-id vol-f5e6217a --description "OpenVPN server keys 13/09/2016."

aws iam create-user --user-name mosh.abrass
aws iam add-user-to-group --user-name mosh.abrass --group-name Admin

aws lambda delete-function --function-name SyncS3Bucket
aws lambda create-function \
  --function-name SyncS3Bucket \
  --runtime python2.7 \
  --role arn:aws:iam::310933283416:role/service-role/Alex \
  --zip-file fileb://s3-utils.zip \
  --handler s3_utils.sync_bucket \
  --memory-size 1024 \
  --timeout 30

aws lambda update-function-code \
  --function-name SyncS3Bucket \
  --zip-file fileb://s3-utils.zip

aws lambda invoke \
--invocation-type RequestResponse \
--function-name SyncS3Bucket \
--region ap-southeast-2 \
--log-type Tail \
--payload '{"key1":"value1", "key2":"value2", "key3":"value3"}' \
outputfile.txt

aws route53 change-resource-record-sets --hosted-zone-id ZJGH0I8EJWKDB \
  --change-batch file:///Users/arthur.rimbun/Desktop/route53-changes.json

aws s3api get-bucket-policy --bucket iag-analytics-tech-pricing
aws s3api put-bucket-policy --bucket iag-analytics-tech-pricing --policy file://put-bucket-policy.json

az login
az vm image list --offer RHEL --all --output table

convert image1.jpg image2.jpg +append left-right.jpg
convert image1.jpg image2.jpg -append top-bottom.jpg

dd if=/dev/disk2 of=output.iso

disown

docker exec -it "container-id" bash

# Remove stopped containers
docker ps --filter "status=exited" | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm

docker rmi -f $(docker images -f "dangling=true" -q)
docker run -ti --rm art2.auiag.corp/docker-awspec bash

docker pull art2.auiag.corp/docker-awspec:latest
docker run \
  --rm \
  -e http_proxy=proxy.auiag.corp \
  -e https_proxy=proxy.auiag.corp \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_REGION=ap-southeast-2 \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -v "$PWD":/awspec \
  art2.auiag.corp/docker-awspec

docker build -t art2.auiag.corp/docker-awspec .

# Ensures that this task exits properly and the result of the tests
# gets parsed in the next step.
exit 0

du -sh * | sort -h
du -sh * | gsort

# Add subtitle "infile.srt" to video "infile.mp4" and outputs a new MP4 file
ffmpeg -i infile.mp4 -i infile.srt -c copy -c:s mov_text outfile.mp4

# Convert FLAC to mp3 256kbps
ffmpeg -i input.flac -ab 256k -map_metadata 0 -id3v2_version 3 output.mp3

git diff master...feature/branch
git log -p
git log --graph --oneline --decorate
git log --after="2014-7-1" --before="2014-7-4"
git log --grep="JRA-224:"
git log -- foo.py bar.py
git log -S"Hello, World!"

gpg --list-public-keys --fingerprints
gpg --keyserver pgp.mit.edu --search-keys mosh.abrass@iag.com.au
gpg --keyserver pgp.mit.edu --recv 0xC1117D1186BCF2E6
gpg -ao file.asc --encrypt --sign -r arthur.rimbun@iag.com.au file.txt
gpg --decrypt file.asc

lsof -i :80 -S | grep nginx

lynx -dump -nolist http://www.smh.com.au/national/health/fake-medical-practitioners-perform-cosmetic-surgeries-in-sydney-flats-and-hotel-rooms-20160707-gq0mhp.html

mkfs -t ext4 /dev/xvdf

mount /dev/xvdf /media/openvpn

mplayer -vo null -ao pcm:file=output.wav input.iso

nc -vz 8.8.8.8 443

netstat -nr -f inet
netstat -nap "LISTEN "

nohup

ntpq -q
ntpdc -c loopinfo
ntpdc -c kerninfo
ntpdate -d              # This will contact an NTP server and determine the time difference but not change your system's time.

pcregrep --color='auto' -n "[\x80-\xFF]" filename.txt

print -l terraform-services/**/* | grep

python -mjson.tool # pretty prints json documents.

quicktype --src schemas/paas/v1/appspace-v0.1.schema.json --src-lang schema --lang go --out test_output.go --package $PACKAGE

route get <address>

rsync -avz ~/Dropbox/ ~/OneDrive/

sftp -P 122 -i ~/.ssh/iag-lexer.pem iag@sftp.lexer.io:data

ssh -i /Users/arthur.rimbun/.ssh/iag-ia-sandbox-jumphost.pem -o
ProxyCommand="nc -X connect -x proxy.some.corp:8080 %h %p" ubuntu@1.2.3.4
ssh -L 5000:localhost:5000 -f centos@10.103.2.0 -N

ssh-keygen -R jumphost3
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub

sudo killall -HUP mDNSResponder

vault kv get -field=value /path/to/secret
vault write  /path/to/secret.txt @value=some.file

wget -q -O - checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
