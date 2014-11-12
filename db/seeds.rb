# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

places = Place.create([
	{ 
		name: 'Hinano', 
		address: '15 W Washington Blvd', 
		rating: '4.3', 
		rating_stars: 'http://s3-media4.fl.yelpcdn.com/assets/2/www/img/9f83790ff7f6/ico/stars/v1/stars_large_4_half.png', 
		url: 'http://www.yelp.com/biz/hinano-caf%C3%A9-venice-2', 
		tip: 'You should go here', 
		phone: '(310) 822-3902', 
		photo: 'http://s3-media3.fl.yelpcdn.com/bphoto/ZKlTc8VfDDWHEI-KPnl8Lg/o.jpg', 
		keywords: ['dive', 'locals', 'live music', 'hipster', 'burger', 'single'],
		yelpid: 'hinano-café-venice-2'
	},
	{
		name: 'Baja Cantina', 
		address: '200 W Washington Blvd', 
		rating: '4.3', 
		rating_stars: 'http://s3-media4.fl.yelpcdn.com/assets/2/www/img/9f83790ff7f6/ico/stars/v1/stars_large_4_half.png', 
		url: 'http://www.yelp.com/biz/hinano-caf%C3%A9-venice-2', 
		tip: 'This is a great place for brunch on Sundays', 
		phone: '(310) 822-3902', 
		photo: 'http://s3-media3.fl.yelpcdn.com/bphoto/ZKlTc8VfDDWHEI-KPnl8Lg/o.jpg', 
		keywords: ['brunch', 'margaritas', 'mexican' ],
		yelpid: 'baja-cantina-marina-del-rey'
	}
	])

moods = Mood.create([
	{
    name: "A New Do for You",
    description: "It's time for a cut. And this place takes the cake.",
    photo: "http://photos.posh24.com/p/986994/z/music_video/willow_smith_crazy_hair.jpg",
    category_id: "beautysvc",
    sort: 2,
    keywords: [
        "barber"
    ],
    days: [
        "Monday",
        "Tuesday",
        "Wednesday"
    ],
    daypart_ids: [
        "late morning",
        "midday",
        "early afternoon"
    ]
}, 
	{
    name: "Healthy Snack after a Run",
    description: "This is a faaaantastic description",
    photo: "http://2.bp.blogspot.com/-WfJ7zv-JNdw/Uj9gRYJ6ejI/AAAAAAAACk8/FkE5bfjpH2g/s1600/Image+5.jpg",
    category_id: "restaurants",
    sort: 2,
    keywords: [
        "healthy",
        "snack"
    ],
    days: [
        "Monday",
        "Tuesday",
        "Wednesday"
    ],
    daypart_ids: [
        "midday",
        "early evening",
        "night"
    ]
},
	{
    name: "Testing New Timestamp",
    description: "Well, well, well",
    photo: "",
    category_id: "food",
    sort: 2,
    keywords: [
        "cherry"
    ],
    days: [
        "Monday"
    ],
},
{
    name: "Shaken...not Stirred",
    description: "As the evening winds down, so should you. Lets retire to a dark corner and sip a martini fit for 007 himself.",
    photo: "http://iqtell.com/wp-content/uploads/2013/05/James-Bond.jpg",
    category_id: "bars",
    sort: 0,
    keywords: [
        "martini"
    ],
    days: [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Friday",
        "Saturday"
    ],
    daypart_ids: [
        "early afternoon",
        "late afternoon",
        "early evening"
    ]
},
{
    name: "Some delicious delivery",
    description: "Yum and yum. Chinese",
    photo: "http://www.handcraftedbymartin.com/blog/wp-content/uploads/2012/05/Chinese-food-delivery-man-leaving-restaurant-with-delivery.-.jpg",
    category_id: "chinese",
    sort: 2,
    daypart_ids: [
        "early evening",
        "night",
        "late night"
    ],
    keywords: [
        "delivery"
    ],
    days: [
        "Tuesday",
        "Wednesday"
    ],
},
{
    name: "Studying in Peace and Quiet",
    description: "Hit the books in a quiet place. Yes please.",
    photo: "http://1.bp.blogspot.com/-LHQ-zVTucIU/T7qFEgKWoWI/AAAAAAAADk0/zGp9VvHWgDE/s1600/Harper+Library+2.jpg",
    category_id: "restaurants",
    sort: 0,
    daypart_ids: [
        "late afternoon",
        "early evening",
        "night",
        "late night"
    ],
    keywords: [
        "quiet",
        " studying"
    ],
    days: [
        "Tuesday",
        "Wednesday"
    ],
},
{
    name: "Late Night Eats",
    description: "Hungry after a long day? Well I've got good news. These places are for you.",
    photo: "http://www.richardalois.com/wp-content/uploads/2011/09/London-Late-Night-Food.jpg",
    category_id: "restaurants",
    sort: 2,
    daypart_ids: [
        "night",
        "late night"
    ],
    keywords: [
        "delivery",
        "chicken"
    ],
    days: [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday"
    ],
},
{
    name: "The Best Workout in Town ",
    description: "So the daily pushups in the kitchen aren't working--here's a better option.",
    photo: "http://www.spirithealthclubs.co.uk/media/1153/Gym.jpg",
    category_id: "active",
    sort: 2,
    daypart_ids: [
        "early morning",
        "morning",
        "late morning",
        "midday"
    ],
    keywords: [
        "gym",
        "membership"
    ],
    days: [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday"
    ],
}
	])

categories = Category.create([
	{ 
    # 1
		name: 'Active Life',
		path: 'active',
		total: 0
	},
	{
    # 2
		name: 'Arts & Entertainment',
		path: 'arts',
		total: 0
	},
	{
    # 3
		name: 'Bars',
		path: 'bars',
		total: 0
	},
	{
		name: 'Beauty & Spas',
		path: 'beautysvc',
		total: 0
	},
	{
		name: 'Financial Services',
		path: 'financialservices',
		total: 0
	},
	{
		name: 'Food',
		path: 'food',
		total: 0
	},
	{
		name: 'Health & Medical',
		path: 'health',
		total: 0
	},
	{
		name: 'Home Services',
		path: 'homeservices',
		total: 0
	},
	{
		name: 'Hotels & Travel',
		path: 'hotelstravel',
		total: 0
	},
	{
		name: 'Local Flavor',
		path: 'localflavor',
		total: 0
	},
	{
		name: 'Nightlife',
		path: 'nightlife',
		total: 0
	},
	{
		name: 'Restaurants',
		path: 'restaurants',
		total: 0
	},
	{
		name: 'Shopping',
		path: 'shopping',
		total: 0
	},
	{
		name: 'Local Services',
		path: 'localservices',
		total: 0
	},
	{
		name: 'All',
		path: '',
		total: 0
	},
	{
		name: 'Restaurants > Pizza',
		path: 'pizza',
		total: 0
	},
	{
		name: 'Restaurants > Mexican',
		path: 'mexican',
		total: 0
	},
	{
		name: 'Restaurants > Italian',
		path: 'italian',
		total: 0
	},
	{
		name: 'Restaurants > Gastropubs',
		path: 'gastropubs',
		total: 0
	},
	{
		name: 'Delis',
		path: 'delis',
		total: 0
	},
	{
		name: 'Restaurants > Chinese',
		path: 'chinese',
		total: 0
	},
	{
		name: 'Coffee & Tea',
		path: 'coffee',
		total: 0
	},
])

dayparts = Daypart.create([
	{ 
		name: 'early morning',
		times: '5..7',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'morning',
		times: '8..9',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'late morning',
		times: '10',
		photo: "http://www.sseubert.com/data/photos/111_1winderlea_vineyard.jpg"
	},
	{ 
		name: 'midday',
		times: '11..12',
		photo: "http://www.hdwallpapersinn.com/wp-content/uploads/2014/08/Lunch-Time-HD-Wallpaper.jpg"
	},
	{
		name: 'early afternoon',
		times: '13..15',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'late afternoon',
		times: '16..17',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'early evening',
		times: '18..19',
		photo: "http://lucianhirsu.ro/wp-content/uploads/2013/02/Santa-Monica-sunset-1.jpg"
	},
	{ 
		name: 'night',
		times: '20..21',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'late night',
		times: '22..23',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'overnight',
		times: '1..2',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	},
	{
		name: 'sleepytime',
		times: '3..4',
		photo: "http://bumcri.org/wp-content/uploads/2014/08/rising-sun.jpg"
	}

])

users = User.create([
	{
    name: "Ran",
    email: "craynkshaft@gmail.com",
    password_digest: "$2a$10$DcngX7PPqb8c7.s8MXxu..MaqHEQdF0g3AYZxHCkc4tq8vEk9SEye",
    zip: 90291,
    access: "admin",
    radius: 1000,
    bio: "This is my damn bio"
},
{
    access: "user",
    name: "Mr. Red",
    email: "reds",
    password_digest: "$2a$10$nwpbp1oybgS3AKMn2tXPiu252t39u8Z.D1SVcmMxa.kXttXJsIBOq",
    zip: 45219,
    radius: 1000,
    bio: "I'm a big Reds fan.",
}
])
