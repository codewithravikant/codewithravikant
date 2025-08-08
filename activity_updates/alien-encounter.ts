// Alien Encounter System - Spaceship Alien Contact Handling

type FriendlyAlien = { name: string; greeting: string };
type HostileAlien = { name: string; weapon: string };
type AlienContact = FriendlyAlien | HostileAlien;

// Function to handle alien encounters with proper type annotations
function handleEncounter(contact: AlienContact): void {
    // Use type guard with 'in' operator to check for greeting property
    if ('greeting' in contact) {
        // This is a friendly alien
        console.log(`${contact.name} says: ${contact.greeting}`);
    } else {
        // This is a hostile alien
        console.log(`Warning! Hostile alien ${contact.name} detected, armed with ${contact.weapon}!`);
    }
}

// Export the types and function for use in other modules
export { 
    FriendlyAlien, 
    HostileAlien, 
    AlienContact, 
    handleEncounter 
}; 