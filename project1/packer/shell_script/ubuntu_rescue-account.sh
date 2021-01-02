#!/bin/bash -x

echo "ADDING USER"
adduser --shell /bin/bash --gecos "" rescue-account

echo "CHANGING PASSWORD"
echo 'rescue-account:$6$7u5lcVsqoyaqqdB6$8n/w4F8xFumD/RjNeDHOBUFCEbQ.u3xE2RQwZ8XzldxfZkNnfiWd5.x8L3M5ElthZTwlpof.O2DbNKBP7HoQe0' | chpasswd -e 

echo "ADDING SUDO"
echo 'rescue-account    ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

echo "CONFIGURE SSH KEY"
mkdir /home/rescue-account/.ssh
touch /home/rescue-account/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCm09Tm2k78be3OzMYOMmQeyKe2grnqbjcaWcNOG7dDLiGJtMfd7sxV57Np/T6xyVAIFfp287bvm9q5Ww1Lhwzyoxpp5ltmbexe75eL9pjD8PeA5erBn2BY/qsYgqLouIOt/IvO3UJq3Y47gGjyNmrJcsSxbi5Lk9694pR+08eAY9Di7Dk93sUq/9P2U7FMhDWNzeHSH3HkuXTiRrlaXeBEGvtAHzFauFWj1czOgaTokbDZyqzgkOH7Drdw5Ca94uNi4zw+kuO8/D5N6tGFN+6B5ADligeiz8uEE5DibGZeRj8RHyFqf1XyyB+0Jeb9zEzraNpyDfCtYc3hMsnnz4C2FQh2mPgVzn6oalGxeoOy1ogoS7MuyloD9fW28GBiUUU7dM827ylB3YGNk5kWjtNSl7NtbFPtKL8HbY3pTfAG5Ruf18CP2EAGOvoJcIehAmmHqyoB90pLk1N9K8o81v0wimm27XKzsLF8LwaMBROt/mSvlwzump038JeOBPjTRBk= user@lab" >> /home/rescue-account/.ssh/authorized_keys
chmod 700 /home/rescue-account/.ssh
chmod 600 /home/rescue-account/.ssh/authorized_keys
chown -R rescue-account:rescue-account /home/rescue-account
