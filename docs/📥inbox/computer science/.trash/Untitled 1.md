To use FTP in Termux to edit files through Neovim, you can follow these steps:

1. **Install Termux packages:**
   Ensure you have `curlftpfs` and `neovim` installed in Termux.

   ```sh
   pkg update
   pkg install curlftpfs neovim
   ```

2. **Mount the FTP server:**
   Use `curlftpfs` to mount the FTP server to a local directory.

   ```sh
   mkdir ~/ftp_mount
   curlftpfs ftp://username:password@ftp.example.com ~/ftp_mount
   ```

   Replace `username`, `password`, and `ftp.example.com` with your FTP server credentials and address.

3. **Navigate to the mounted directory:**
   Change to the directory where you mounted the FTP server.

   ```sh
   cd ~/ftp_mount
   ```

4. **Edit files with Neovim:**
   Now you can open and edit files using Neovim.

   ```sh
   nvim filename
   ```

   Replace `filename` with the name of the file you want to edit.

5. **Unmount the FTP server:**
   After editing, unmount the FTP server when you're done.

   ```sh
   fusermount -u ~/ftp_mount
   ```

By following these steps, you'll be able to use FTP in Termux to edit files through Neovim.