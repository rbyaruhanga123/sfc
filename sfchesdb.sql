DROP TABLE IF EXISTS cumulative_flow_equipment_status_uwm;

CREATE TABLE sfches.cumulative_flow_equipment_status_uwm (
    id SERIAL PRIMARY KEY,
    imei TEXT,
    device_sr TEXT,
    purchase_credit FLOAT,
    cumulative_flow FLOAT,
    battery_status TEXT,
    valve_status TEXT,
    pipe_direction TEXT,
    flow_status TEXT,
    temp_sensor_fault TEXT,
    waterpipe_leackage_fault TEXT,
    valve_failure TEXT,
    reverse_flow TEXT,
    battery_power_alarm TEXT,
    battery_power FLOAT,
    rscp FLOAT,
    snr FLOAT,
    remarks TEXT,
    hex_string TEXT,
    time TIMESTAMP,
    CONSTRAINT idx_imei_time_uwm UNIQUE (imei, time)
);

DROP TABLE IF EXISTS direct_downlink_command;

CREATE TABLE sfches.direct_downlink_command (
    id SERIAL PRIMARY KEY,
    imei TEXT,
    command TEXT,
    time TIMESTAMP,
    execution_status INT DEFAULT 0,
    execution_time TIMESTAMP,
    reporting_status INT DEFAULT 0,
    reporting_time TIMESTAMP,
    reporting_detail TEXT
);

DROP TABLE IF EXISTS downlink_command;

CREATE TABLE sfches.downlink_command (
    id SERIAL PRIMARY KEY,
    imei TEXT,
    command TEXT,
    time TIMESTAMP,
    execution_status INT DEFAULT 0,
    execution_time TIMESTAMP,
    reporting_status INT DEFAULT 0,
    reporting_time TIMESTAMP,
    reporting_detail TEXT
);

CREATE INDEX idx_imei_time_uwm ON sfches.downlink_command (imei, time);

DROP TABLE IF EXISTS raw_data_water_meter;

CREATE TABLE sfches.raw_data_water_meter (
    id SERIAL PRIMARY KEY,
    hex_string TEXT,
    time TIMESTAMP
);

DROP TABLE IF EXISTS wm_downstream_command_v1;

CREATE TABLE sfches.wm_downstream_command_v1 (
    id SERIAL PRIMARY KEY,
    imei TEXT,
    command TEXT,
    time TIMESTAMP,
    execution_status INT DEFAULT 0,
    execution_time TIMESTAMP,
    reporting_status INT DEFAULT 0,
    reporting_time TIMESTAMP,
    reporting_detail TEXT
);

CREATE INDEX idx_imei_time_mwm ON sfches.wm_downstream_command_v1 (imei, time);

DROP TABLE IF EXISTS wm_upstream_data_raw_v1;

CREATE TABLE sfches.wm_upstream_data_raw_v1 (
    id SERIAL PRIMARY KEY,
    model TEXT,
    time TIMESTAMP,
    imei TEXT,
    hexStr TEXT
);

DROP TABLE IF EXISTS wm_upstream_data_v1;

CREATE TABLE sfches.wm_upstream_data_v1 (
    id SERIAL PRIMARY KEY,
    model TEXT,
    time TIMESTAMP,
    utc_offset TEXT,
    device_type TEXT,
    hardware_version TEXT,
    software_version TEXT,
    serial_nember TEXT,
    battery_status TEXT,
    message_sequence FLOAT,
    power_source_voltage FLOAT,
    measurement_model TEXT,
    meter_reading FLOAT,
    measurement_fault_status FLOAT,
    valve_current_status TEXT,
    valve_fault_status TEXT,
    valve_type TEXT,
    payment_function INT,
    overdraft_volume INT,
    available_water_allowance FLOAT,
    magnetic_attack_status TEXT,
    happened_magnetic_attack TEXT,
    delivery_frequency FLOAT,
    imei TEXT,
    rssi FLOAT,
    snr FLOAT
);

CREATE INDEX idx_imei_time_mwm ON sfches.wm_upstream_data_v1 (imei, time);
