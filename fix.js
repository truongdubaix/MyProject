import mysql from "mysql2/promise";
const run = async () => {
    try {
        const pool = mysql.createPool({
            host: "localhost",
            user: "root",
            password: "",
            database: "speedyship"
        });
        
        await pool.query("ALTER TABLE notifications MODIFY COLUMN target_role ENUM('driver', 'dispatcher', 'admin', 'customer')");
        console.log("Enum fixed!");
        
        const [rows] = await pool.query("DESCRIBE notifications");
        console.log("Schema:", rows);
        
        process.exit(0);
    } catch(err) {
        console.error("Error:", err);
        process.exit(1);
    }
}
run();
