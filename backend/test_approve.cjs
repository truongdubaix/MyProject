const mysql = require('mysql2/promise');
require('dotenv').config();

async function test() {
  const pool = mysql.createPool({ host: 'localhost', user: 'root', password: '', database: 'speedyship' });
  try {
    const [[app]] = await pool.query('SELECT * FROM driver_applications WHERE id = 12');
    if (!app) { console.log('App not found'); return; }
    
    const [[existingUser]] = await pool.query('SELECT id FROM users WHERE email = ?', [app.email]);
    let userId = existingUser ? existingUser.id : null;
    if (!userId) {
      console.log('Inserting user...');
      const [userRes] = await pool.query(
        "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, 'driver')",
        [app.name, app.email, 'hash']
      );
      userId = userRes.insertId;
      console.log('Inserted user', userId);
    }
    
    console.log('Inserting driver...');
    const [driverRes] = await pool.query(
      "INSERT INTO drivers (user_id, name, phone, email, license_no, vehicle_type, status) VALUES (?, ?, ?, ?, ?, ?, 'free')",
      [userId, app.name, app.phone, app.email, app.license_plate, app.vehicle_type]
    );
    const driverId = driverRes.insertId;
    console.log('Inserted driver', driverId);
    
    console.log('Inserting vehicle...');
    const [vehicleRes] = await pool.query(
      "INSERT INTO vehicles (plate_no, type, capacity_kg, driver_id, status) VALUES (?, ?, ?, ?, 'available')",
      [app.license_plate, app.vehicle_type, 150, driverId]
    );
    console.log('Inserted vehicle', vehicleRes.insertId);
    process.exit(0);
  } catch (err) {
    console.error('ERROR:', err.message);
    process.exit(1);
  }
}
test();
