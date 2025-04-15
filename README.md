# DNServ Xbox 360 Repo Aurora

This repository includes a set of utility scripts designed to enhance the Xbox 360 Aurora environment. These scripts automate various maintenance tasks such as proper labeling of multi-disc games and efficient management of Title Updates.

## Scripts Overview

### AutoCacheBak2Cache *(Not in the repository)*  
**Description:**  
Automatically copies Title Update files from the `cacheBak` folder to the `cache` folder on startup. This is useful if you maintain a collection of cache TU in `cacheBak`, as cache TU are constantly deleted.

---

### AutoCache2CacheBak *(Not in the repository)*  
**Description:**  
Automatically copies Title Update files from the `cache` folder to the `cacheBak` folder on startup, providing a convenient method to back up TU from the cache folder.

---

### DNServDiscs
**Description:**  
Correctly labels multi-disc games to ensure proper organization and display within your system.

---

### DNServ TU Restore
**Description:**  
Restores Title Update data to the system cache from cacheBak maintaining TU after they get deleted.

---

### DNServ Aurora TU Clear
**Description:**  
Clears all entries from the TitleUpdates table, Good if you are using TU Restore.

---

## Installation Instructions

1. **Download the Repository:**
   - Download the `DNServRepo` folder.

2. **Copy Files:**
   - Place the downloaded `DNServRepo` folder into your scripts folder, located at:
     ```
     User\Scripts\Utility\
     ```
   - This folder is part of your existing Aurora installation.

Once the repository is correctly installed, the utility scripts will be available for use on your Aurora scripts menu.

## Usage

After installation, run the scripts as needed to manage multi-disc game labels and Title Update data. Please refer to any inline comments within the scripts for detailed usage instructions.

---
