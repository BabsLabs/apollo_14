describe "Astronaut index page" do
  describe "as a vistior" do
    it "I can see a list of astronauts with name, age, and job" do

      @buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 89, job: 'Mission Commander' )
      @chris = Astronaut.create!(name: 'Chris Hadfield', age: 60, job: 'Space Station Commander')

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

      expect(page).to have_content('Avergage Astronaut Age: 74.5')

    end
  end
end