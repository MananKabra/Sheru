Here's the refined README with improved image presentation and added details about the admin CSV export functionality:

---

# Flutter Firebase E-Commerce App

Welcome to the **Flutter Firebase E-Commerce App**! This application is a comprehensive and feature-rich platform for online shopping, built using Flutter and Firebase. It offers various user flows, including Guest, Buyer, Seller, and Admin. Follow the instructions below to set up the project and explore its features.


![Screenshot_1725123751](https://github.com/user-attachments/assets/7ee15bea-a6ef-43a9-a7f5-ea9228d1330b)
![Screenshot_1725123771](https://github.com/user-attachments/assets/9c35c220-1b5a-4c19-8cad-7b7bc9d20133)
![Screenshot_1725123628](https://github.com/user-attachments/assets/b9cd7e6e-0384-4422-b1e4-2d8b5c6d3e29)
![Screenshot_1725123621](https://github.com/user-attachments/assets/fdcd7634-9439-4f61-8fe8-cb2cebcbf379)
![Screenshot_1725123617](https://github.com/user-attachments/assets/8560aaeb-2c51-4988-9196-7705d6098c2f)
![Screenshot_1725123614](https://github.com/user-attachments/assets/cfd5c330-e358-4390-b52c-fe214912a119)
![Screenshot_1725123607](https://github.com/user-attachments/assets/553c6ab2-9af7-4d3f-bac2-21cf1629dfe5)
![Screenshot_1725123597](https://github.com/user-attachments/assets/711866a7-4d77-4895-b3c6-f2f3a75815be)
![Screenshot_1724308916](https://github.com/user-attachments/assets/578a39e1-ad24-4d44-90a5-af7664f32c1b)
![Screenshot_1725123663](https://github.com/user-attachments/assets/74d8e460-511c-4bb9-a59d-88d6cc5b6d5d)
![Screenshot_1725123654](https://github.com/user-attachments/assets/4d379e2c-a052-46ea-bc1f-6daadcf0dc58)
![Screenshot_1725123643](https://github.com/user-attachments/assets/b447e1e2-156a-43db-97ce-963dc17b6705)
![Screenshot_1725123639](https://github.com/user-attachments/assets/6977cc2d-657e-4353-a09d-809de96c6215)
![Screenshot_1725123634](https://github.com/user-attachments/assets/b1e43da9-2a92-477f-899f-87d34da47ae5)


## Getting Started

### 1. Add the Android Folder

If your project doesn't already include an `android` folder, you can generate it by running the following command in your main project directory:

```bash
flutter create .
```

### 2. Firebase Setup

To fully leverage Firebase features within your app, you’ll need to configure Firebase. Choose one of the following methods:

#### Option A: Add `firebase.json` File

1. Download the `firebase.json` configuration file from the Firebase Console.
2. Place the file in the root directory of your project.
3. Alternatively, you can use the Firebase CLI to configure Firebase.

#### Option B: Use Firebase Emulator

Set up the Firebase Emulator to simulate Firebase services locally:

1. Install the Firebase CLI if you haven't already:
   ```bash
   npm install -g firebase-tools
   ```

2. Initialize Firebase in your project:
   ```bash
   firebase init
   ```

3. Start the Firebase Emulator with Initial Data:
   ```bash
   firebase emulators:start --import=./emulator-data
   ```

---

# Flutter Firebase E-Commerce Admin Panel

Welcome to the **Flutter Firebase E-Commerce Admin Panel**! This admin panel is designed to provide seamless control over the e-commerce platform, enabling administrators to manage products, sellers, coupons, banners, and more.

## Features Overview

### 1. Special Product Management
- **Upload Special Products**: Administrators can upload exclusive products directly from the admin panel. These products will be highlighted on the platform for special promotions or featured categories.

### 2. Seller Product Approval
- **Approve Seller Products**: Review and approve products submitted by sellers before they appear on the platform. This ensures quality control and adherence to platform guidelines.

### 3. Coupon and Banner Management
- **Add Coupons**: Create and manage discount coupons to offer special deals and promotions to customers.
- **Add Banners**: Upload and manage promotional banners that will be displayed throughout the app. Banners can be used to highlight special events, sales, or new arrivals.

### 4. App Management
- **Comprehensive Control**: The admin panel offers full control over various aspects of the app, allowing administrators to ensure the smooth operation of the platform.

### 5. Export Data as CSV
- **Admin CSV Export**: Easily export product, seller, or order data as CSV files for analysis or reporting purposes. This feature enables administrators to keep records and perform data-driven decisions.

## Screenshots

Here's a visual overview of the admin panel features:

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/c98f5c3f-144d-48a5-827d-31f78f34e2f6" alt="Admin Dashboard" style="width: 100%; height: auto;">
  <img src="https://github.com/user-attachments/assets/8cac231d-81d5-475b-8140-a5be247998c7" alt="Product Management" style="width: 100%; height: auto;">
  <img src="https://github.com/user-attachments/assets/aa4ee0d3-41ca-4f49-9b0e-63c8ad9acc95" alt="Seller Approvals" style="width: 100%; height: auto;">
  <img src="https://github.com/user-attachments/assets/e2d1c5ec-5221-4ceb-a3ac-533748e7c15d" alt="Coupon Management" style="width: 100%; height: auto;">
  <img src="https://github.com/user-attachments/assets/394fb2f3-d930-4d38-9c89-6274b4443137" alt="Banner Management" style="width: 100%; height: auto;">
  <img src="https://github.com/user-attachments/assets/5ea2e0ba-c193-4679-8e8b-642bd1af765f" alt="Data Export" style="width: 100%; height: auto;">
</div>

## Getting Started

### 1. Prerequisites

- Ensure that the main e-commerce app is set up and configured with Firebase.
- The admin panel should have the appropriate Firebase configurations (e.g., `firebase.json`) in place to interact with the backend.

### 2. Installation

1. Navigate to the project directory:
   ```bash
   cd sharekhan_admin_panel
   ```

2. Install the required dependencies:
   ```bash
   flutter pub get
   ```

### 3. Running the Admin Panel

To start the admin panel, run the following command:

```bash
flutter run --web-renderer html
```

## Usage

- **Special Products**: Use the "Special Products" section to add new items that will be featured on the platform.
- **Seller Approvals**: Navigate to the "Seller Approvals" section to review and approve products submitted by third-party sellers.
- **Coupons and Banners**: Access the "Coupons" and "Banners" sections to create and manage promotional content.
- **Export as CSV**: In the admin panel, locate the export functionality to download relevant data as CSV files for offline analysis and reporting.

---

