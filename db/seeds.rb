# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#---------------------------- Merchants ----------------------------#
florist = Merchant.create(
  name: 'Florist Gump',
  address: '1523 N Main Street',
  city: 'Plaintree',
  state: 'MN',
  zip: 49155
)
fuschia = Merchant.create(
  name: 'Back to the Fuschia',
  address: '943 Burberry Drive',
  city: 'Kirksville',
  state: 'NC',
  zip: 30846
)
pine_oakio = Merchant.create(
  name: 'Pine Oakio',
  address: '12 Montgomery Lane',
  city: 'Alden',
  state: 'AL',
  zip: 61350
)

#---------------------------- Items ----------------------------#
plumeria = Item.create(
  name: 'Plumeria Plant',
  description: 'The plumeria plant, also known as the "Scent of Hawaii", is like no other plant. It has electric hues of yellow, pink, and white blossoms that bloom from April until November. It also has a slender, geometric shape, and soft foliage that will branch and produce up to 60 flowers and over 100 blossoms each year.',
  price: 93.20,
  image: 'https://images.pexels.com/photos/63609/plumeria-flower-frangipani-plant-63609.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: true,
  inventory: 14,
  merchant_id: florist.id
)
dahlia = Item.create(
  name: 'Dahlia Bulbs - Contraste Variety',
  description: 'A timeless dahlia favorite, introduced almost 60 years ago and still going strong. The big blooms measure up to eight inches across and have striking two-tone petals that are deep burgundy and purple with brilliant white tips.',
  price: 15.40,
  image: 'https://images.pexels.com/photos/910645/pexels-photo-910645.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: true,
  inventory: 32,
  merchant_id: florist.id
)
rose = Item.create(
  name: 'Clementine Rose Bush',
  description: 'This rose bush grows long, pointed buds that open to classically shaped, four-inch blooms that have an artistic feel to their color - a rich apricot-blush, over-layed with copper tones toward the edge of the petals. The striking blooms are plentifully produced against bright-green, glossy leaves.',
  price: 45.63,
  image: 'https://images.pexels.com/photos/53007/rose-rose-family-rosaceae-composites-53007.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: false,
  inventory: 8,
  merchant_id: florist.id
)
lily = Item.create(
  name: 'Oriental Stargazer Lily',
  description: 'Stargazer lilies are very fragrant and are probably the best known of all lilies. These florist quality lilies have outward facing bowl shaped blooms, producing 6-8 flowers per stem. They are sturdy and long-lasting, growing into impressive plants.',
  price: 22.46,
  image: 'https://images.pexels.com/photos/374134/pexels-photo-374134.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: true,
  inventory: 17,
  merchant_id: florist.id
)
hibiscus = Item.create(
  name: 'Pink Tropical Hibiscus Tree',
  description: 'Adding a tropical feel to your garden or landscape has never been easier. The pink tropical hibiscus tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height. Its breathtaking blooms occur year-round',
  price: 108.65,
  image: 'https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: true,
  inventory: 6,
  merchant_id: pine_oakio.id
)
olive = Item.create(
  name: 'Arbequina Olive Tree',
  description: "It's the most versatile variety on the market: The Arbequina Olive Tree. Not only does it produce table olives, but it's also used to make highly-valued olive oil. And this tree offers evergreen beauty and fragrant spring blooms to go along with its succulent fruit.",
  price: 84.99,
  image: 'https://images.pexels.com/photos/1047312/pexels-photo-1047312.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: false,
  inventory: 4,
  merchant_id: pine_oakio.id
)
maple = Item.create(
  name: 'Japanese Maple Tree',
  description: "The Japanese Maple Tree is a garden designer's favorite because of its texture, deep red leaf color, size, and cascading habit. It has been in production for over 300 years, a selection from the Kobayashi Nursery of old. This lovely cascading maple covers itself in finely cut, delicate leaves.",
  price: 71.95,
  image: 'https://images.pexels.com/photos/715134/pexels-photo-715134.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: false,
  inventory: 6,
  merchant_id: pine_oakio.id
)
tulip = Item.create(
  name: 'Tulip Bulbs - La Courtine Variety',
  description: 'These jumbo, late-blooming tulips will fill your garden with brilliant spring color. Their golden yellow petals are adorned with fire engine red stripes and feathering. The colors are bold, yet La Courtine has a remarkable elegance.',
  price: 9.50,
  image: 'https://images.pexels.com/photos/1060876/pexels-photo-1060876.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  active?: true,
  inventory: 22,
  merchant_id: florist.id
)

#---------------------------- Users ----------------------------#
kyle = User.create(
  name: 'Kyle Pine',
  address: '763 Chesterfield Street',
  city: 'Jacksonville',
  state: 'FL',
  zip: '38342'
)
cynthia = User.create(
  name: 'Cynthia Hall',
  address: '9247 E 42nd Avenue',
  city: 'Tucson',
  state: 'AZ',
  zip: '85701'
)

#---------------------------- Orders ----------------------------#
order_1 = kyle.orders.create!(grand_total: (rose.price + dahlia.price * 2), verification_code: '7593830921')
order_1.item_orders.create(item_id: dahlia.id, item_quantity: 2, subtotal: dahlia.price * 2)
order_1.item_orders.create(item_id: rose.id, item_quantity: 1, subtotal: rose.price)

order_2 = cynthia.orders.create!(grand_total: (plumeria.price + rose.price * 3 + hibiscus.price), verification_code: '2859017482')
order_2.item_orders.create(item_id: plumeria.id, item_quantity: 1, subtotal: plumeria.price)
order_2.item_orders.create(item_id: rose.id, item_quantity: 3, subtotal: rose.price * 3)
order_2.item_orders.create(item_id: hibiscus.id, item_quantity: 1, subtotal: hibiscus.price)

#---------------------------- Reviews ----------------------------#
plumeria.reviews.create([
  {
    title: 'Beautiful!',
    content: "The most beautiful plant I've ever grown!",
    rating: 5
  },
  {
    title: 'Meh.',
    content: 'Does not survive snowy weather.',
    rating: 2
  },
  {
    title: 'I love this plant',
    content: 'It brings me great joy',
    rating: 5
  },
  {
    title: 'Foliage is not soft',
    content: 'Misleading description',
    rating: 1
  },
  {
    title: 'Needs lots of water',
    content: 'Cannot go a single day without watering',
    rating: 3
  },
  {
    title: 'Blooms for a long time!',
    content: 'The flowers stay beautiful for weeks.',
    rating: 4
  },
  {
    title: 'Very cool plant',
    content: 'Adds tropical flair to my home',
    rating: 5
  }
])

dahlia.reviews.create([
  {
    title: 'Lovely flowers',
    content: "I can't wait for them to come back next year!",
    rating: 4
  },
  {
    title: 'Never grew',
    content: 'I followed the directions but they never sprouted',
    rating: 1
  },
  {
    title: 'Very showy!',
    content: 'Love showing them off to the neighbors',
    rating: 5
  },
  {
    title: 'Excellent coloring',
    content: 'Wonderful contrast between petals',
    rating: 4
  },
  {
    title: 'Great for beginners',
    content: "They don't require a lot of special attential",
    rating: 5
  },
  {
    title: 'Short but beautiful blooms',
    content: 'Only bloomed for a day. Lovely flowers though',
    rating: 3
  }
])

rose.reviews.create([
  {
    title: 'Most beautiful rose bush',
    content: 'Wonderful to look at',
    rating: 5
  },
  {
    title: 'Breathtaking color',
    content: 'Somewhere between peach and sunset orange',
    rating: 5
  },
  {
    title: 'Not enough blooms',
    content: 'I do love the shape of the bush though',
    rating: 4
  },
  {
    title: 'Buds open slowly',
    content: 'It keeps the rose-like feeling for longer than most rose bushes',
    rating: 5
  },
  {
    title: 'Very hardy',
    content: 'Survived -30 degrees F and lots of snow',
    rating: 5
  },
  {
    title: 'Lots of thorns',
    content: "Beautiful rose bush. Just don't touch it",
    rating: 4
  }
])

lily.reviews.create([
  {
    title: 'Simply gorgeous',
    content: 'Love the pink and red freckles',
    rating: 5
  },
  {
    title: 'Easy to grow',
    content: 'Grow easily and are a striking addition to the garden',
    rating: 4
  }
])

hibiscus.reviews.create([
  {
    title: 'Very tropical',
    content: 'It brightens up my Minnesota garden',
    rating: 5
  },
  {
    title: "Doesn't bloom often",
    content: 'Blooms are quite pretty though',
    rating: 4
  },
  {
    title: 'Smaller than expected',
    content: 'Definitely would not call this a tree',
    rating: 2
  },
  {
    title: 'Dies very easily',
    content: 'I watered it every day and it still died',
    rating: 1
  },
  {
    title: 'Magnificent color',
    content: 'Love the bright pink',
    rating: 5
  },
  {
    title: "It's just OK",
    content: 'Nothing too special',
    rating: 3
  }
])

olive.reviews.create([
  {
    title: 'Does not produce fruit',
    content: 'The description is one big lie!',
    rating: 1
  },
  {
    title: "Meh. It's a tree.",
    content: 'Not great',
    rating: 3
  },
  {
    title: 'Pot is too small',
    content: 'Definitely needs a bigger pot',
    rating: 2
  },
  {
    title: 'Somehow has thorns?!',
    content: 'What kind of olive tree is this?',
    rating: 1
  },
  {
    title: 'Awful shade of green',
    content: 'Leaves are not olive green at all',
    rating: 2
  }
])

maple.reviews.create([
  {
    title: 'Beautiful tree',
    content: 'Leaves are strikingly red all year round',
    rating: 5
  },
  {
    title: 'Grows too slowly',
    content: 'Very nice tree, but grows extremely slowly',
    rating: 3
  }
])

tulip.reviews.create([
  {
    title: 'Wonderful contrast',
    content: 'The red and yellow is quite striking',
    rating: 4
  },
  {
    title: 'Never sprouted',
    content: "Don't waste your time and money",
    rating: 1
  }
])
