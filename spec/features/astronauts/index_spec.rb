describe "Astronaut index page" do
  describe "as a vistior" do
    it "I can see a list of astronauts with name, age, and job" do

      @buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 89, job: 'Mission Commander' )
      @chris = Astronaut.create!(name: 'Chris Hadfield', age: 60, job: 'Space Station Commander')
      @space_walk = @buzz.missions.create!(title: 'Space Walk', time_in_space: 200)

      visit '/astronauts'

      within "#astronaut-#{@buzz.id}" do
        expect(page).to have_content('Name: Buzz Aldrin')
        expect(page).to have_content('Age: 89')
        expect(page).to have_content('Job: Mission Commander')
      end

      within "#astronaut-#{@chris.id}" do
        expect(page).to have_content('Name: Chris Hadfield')
        expect(page).to have_content('Age: 60')
        expect(page).to have_content('Job: Space Station Commander')
      end

      within "#stats" do
        expect(page).to have_content('Avergage Astronaut Age: 74.5')
      end

      within "#missions_list_#{@buzz.id}" do
        expect(page).to have_content('Mission: Space Walk')
        expect(page).to have_content('Time In Space: 200')
      end
    end
  end
end