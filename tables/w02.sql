CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

INSERT INTO service_project (organization_id, title, description, location, date)
VALUES
(1, 'Downtown Park Cleanup', 'Cleaning up the main downtown park.', 'Downtown Park', '2027-04-10'),
(1, 'Riverfront Restoration', 'Planting trees along the river.', 'Riverfront', '2027-04-15'),
(1, 'Community Center Repair', 'Fixing the roof of the center.', 'Main St Community Center', '2027-05-01'),
(1, 'Playground Building', 'Building a new playground.', 'Southside', '2027-05-20'),
(1, 'Homeless Shelter Expansion', 'Adding beds to the shelter.', 'North Ave', '2027-06-10'),
(2, 'Urban Garden Planting', 'Planting spring vegetables.', 'Eastside Garden', '2027-03-25'),
(2, 'Compost Workshop', 'Teaching composting techniques.', 'City Hall Plaza', '2027-04-05'),
(2, 'Farmers Market Setup', 'Setting up stalls for the season.', 'Town Square', '2027-05-12'),
(2, 'School Greenhouse Build', 'Building a greenhouse for kids.', 'Lincoln High', '2027-05-30'),
(2, 'Food Bank Harvest', 'Harvesting and delivering food.', 'West Farm', '2027-06-15'),
(3, 'Senior Center Bingo', 'Hosting bingo night for seniors.', 'Sunny Days Center', '2027-03-20'),
(3, 'Youth Mentorship', 'Mentoring high school students.', 'YMCA', '2027-04-02'),
(3, 'Soup Kitchen Serving', 'Serving lunch to the needy.', 'Grace Church', '2027-04-18'),
(3, 'Charity Run Volunteering', 'Handing out water at the 5k.', 'City Park', '2027-05-05'),
(3, 'Library Book Sorting', 'Organizing donated books.', 'Public Library', '2027-05-25');



CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES service_project (project_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

INSERT INTO category (name) VALUES 
('Environmental'), 
('Educational'), 
('Community Service'), 
('Health and Wellness');

INSERT INTO project_category (project_id, category_id) VALUES 
(1, 1), (1, 3),
(2, 1),
(3, 3),
(4, 3),
(5, 4),
(6, 1),
(7, 2),
(8, 3),
(9, 2),
(10, 3),
(11, 3),
(12, 2),
(13, 3),
(14, 4),
(15, 2);

