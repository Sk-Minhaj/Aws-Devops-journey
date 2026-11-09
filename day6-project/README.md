# Day 6 project: Nginx on EC2
## Files
- nginx/index.html: custom page served by Nginx
- nginx/nginx.conf: Nginx config from the EC2 server
- scripts/hello.sh: practice shell script
## How to use
1. Install Nginx: sudo dnf install -y nginx
2. Copy index.html to /usr/share/nginx/html/ using sudo
3. Start it: sudo systemctl enable --now nginx
4. Open http://EC2-PUBLIC-IP in a browser (port 80 must be open in the security group)
