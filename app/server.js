const express = require("express");

const app = express();

const PORT = process.env.PORT || 3000;
const VERSION = process.env.APP_VERSION || "1.0.0";

app.get("/", (req, res) => {
    res.json({
        application: "e-commerce-app",
        version: VERSION,
        message: "Application is running successfully"
    });
});

app.get("/health", (req, res) => {
    res.status(200).json({
        status: "healthy",
        version: VERSION
    });
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
});
