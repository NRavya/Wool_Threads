const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const bodyParser = require("body-parser");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(express.static("public")); // Serve static files from the 'public' directory

// Connect to MongoDB (replace with your MongoDB URI)
mongoose
  .connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.error("MongoDB connection error:", err));

// User schema
const userSchema = new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
});

const User = mongoose.model("User", userSchema);

// Sample data for wool prices, market trends, user settings, splash screen, and tracking information
const marketData = {
  pricePerKg: 50,
  trend: "Stable",
  supplyChainInfo:
    "Wool is sourced from local farms and processed at our facility.",
};

const userSettings = {
  notificationsEnabled: true,
  preferredUnits: "kg",
};

// Sample splash screen data
const splashScreenData = {
  title: "Welcome to Wool Supply Chain",
  message: "Loading your experience...",
};

// Sample tracking data
const trackingData = [
  {
    id: 1,
    shipmentId: "SH12345",
    status: "In Transit",
    location: "Warehouse A",
    estimatedDelivery: "2025-01-30",
  },
  {
    id: 2,
    shipmentId: "SH12346",
    status: "Delivered",
    location: "Customer Address",
    estimatedDelivery: "2025-01-25",
  },
];

// Middleware to check for a valid token
const authenticateToken = (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1]; // Get token from Authorization header

  if (!token) return res.sendStatus(401); // No token provided

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403); // Invalid token
    req.user = user; // Attach user info to request object
    next(); // Proceed to the next middleware or route handler
  });
};

// Define a route for the root path
app.get("/", (req, res) => {
  res.send("Welcome to the API!");
});

// Endpoint to get splash screen data
app.get("/api/splash", (req, res) => {
  res.json(splashScreenData);
});

// Endpoint for user registration
app.post("/api/register", async (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = new User({ email, password: hashedPassword });

  try {
    await newUser.save();
    res.status(201).send("User registered successfully");
  } catch (error) {
    res.status(400).send("Error registering user");
  }
});

// Endpoint for user login
app.post("/api/login", async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });
    if (!user) return res.status(400).send("Invalid email or password");

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(400).send("Invalid email or password");

    // Generate JWT token
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
      expiresIn: "1h",
    });
    res.json({ token });
  } catch (error) {
    res.status(500).send("Server error");
  }
});

// Endpoint to get market information (protected)
app.get("/api/market-info", authenticateToken, (req, res) => {
  res.json(marketData);
});

// Endpoint to get supply chain information (protected)
app.get("/api/supply-chain", authenticateToken, (req, res) => {
  res.json({ supplyChainInfo: marketData.supplyChainInfo });
});

// Endpoint to get user settings (protected)
app.get("/api/settings", authenticateToken, (req, res) => {
  res.json(userSettings); // Return the user settings data
});

// Endpoint to get tracking information (protected)
app.get("/api/tracking", authenticateToken, (req, res) => {
  res.json(trackingData); // Return the tracking data
});

// Catch-all route for undefined paths
app.get("*", (req, res) => {
  res.status(404).send("404 Page Not Found");
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
