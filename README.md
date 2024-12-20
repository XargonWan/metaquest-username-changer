# MetaQuest Username Changer

A lightweight Bash script designed to create and upload JSON configuration files for managing usernames on Meta Quest devices via ADB. This tool also updates the global username setting directly on the device.

## Features
- Generates JSON files for multiple platforms (`user.json`, `vrmoo.cn.json`, etc.).
- Allows verification of created files before uploading.
- Uploads JSON files to the device's `/sdcard/` directory.
- Updates the global username on the device using ADB.

## Requirements
- A computer with Bash support (Linux, macOS, or Windows with WSL/Git Bash).
- [ADB (Android Debug Bridge)](https://developer.android.com/studio/command-line/adb) installed and added to your system's PATH.
- A Meta Quest device connected via USB with Developer Mode enabled.

## Usage
1. Clone this repository:
   ```
   git clone https://github.com/yourusername/metaquest-username-changer.git
   cd metaquest-username-changer
   ```
2. Make the script executable:
   ```
   chmod +x metaquest-username-changer.sh
   ```
3. Run the script with a username as an argument:
   ```
   ./metaquest-username-changer.sh YOUR_USERNAME
   ```
   If no username is provided, the script will prompt you to enter one.

## How It Works
1. The script generates JSON files with the provided username:
   - `user.json`
   - `vrmoo.cn.json`
   - `qq1091481055.json`
   - `dollarvr.com.json`
2. It prompts you to verify the files before uploading.
3. Once confirmed, the script uploads the files to the device using ADB.
4. The global username on the device is updated via the ADB `settings` command.

## Example
Running the script with:
```
./metaquest-username-changer.sh Player123
```
Will:
- Create JSON files containing `Player123` as the username.
- Upload them to `/sdcard/` on the device.
- Set `Player123` as the global username.

## Customization
You can modify the script to:
- Change the location where JSON files are uploaded.
- Add or remove specific JSON file formats.

## Troubleshooting
- Ensure your device is connected and recognized by ADB:
  ```
  adb devices
  ```
- Verify ADB is properly installed and in your PATH.
- Check that Developer Mode is enabled on your Meta Quest device.

## Contributing
Contributions, bug reports, and feature requests are welcome! Please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

Feel free to customize this README further based on your repository's specifics!
