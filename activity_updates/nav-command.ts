// Temporal Metadata - Common timestamp for all navigation commands
type Timestamp = {
    timestamp: Date;
};

// Destination Information - Navigation targets with planet and sector
type Destination = {
    planetName: string;
    sector: string;
} & Timestamp;

// Warp Drive Engagement - Faster-than-light travel configuration
type WarpDrive = {
    warpFactor: number;
} & Timestamp;

// Command Union - Can be either a Destination or WarpDrive command
type NavigationCommand = Destination | WarpDrive;

// Create a destination command with timestamp
const destination: Destination = {
    planetName: "Vulcan",
    sector: "Alpha Quadrant",
    timestamp: new Date("2024-01-15T10:30:00Z")
};

// Create a warp drive command with timestamp
const warpDrive: WarpDrive = {
    warpFactor: 9.5,
    timestamp: new Date("2024-01-15T10:35:00Z")
};

// Navigation command variable that can hold either type
const navigationCommand: NavigationCommand = destination;

// Export the types and variables for use in other modules
export { 
    Timestamp, 
    Destination, 
    WarpDrive, 
    NavigationCommand, 
    destination, 
    warpDrive, 
    navigationCommand 
}; 